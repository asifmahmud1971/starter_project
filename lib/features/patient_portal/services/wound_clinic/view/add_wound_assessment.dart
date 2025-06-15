import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/services/wound_clinic/cubit/woundClinic_cubit.dart';

class AddWoundAssessment extends StatefulWidget {
  const AddWoundAssessment({super.key});

  @override
  State createState() => _AddWoundAssessmentState();
}

class _AddWoundAssessmentState extends State<AddWoundAssessment> {
  File? _selectedFile;
  String _fileName = 'No file chosen';


  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
          _fileName = result.files.single.name;
        });
        context.read<WoundClinicCubit>().uploadWoundDocument(imagePath: _selectedFile?.path);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting file: $e')),
      );
    }
  }


  Widget _buildFileInfo() {
    if (_selectedFile == null) return SizedBox();

    final extension = _fileName.split('.').last.toLowerCase();
    final fileSize = (_selectedFile!.lengthSync() / 1024).toStringAsFixed(2);

    IconData icon;
    Color iconColor;

    if (['jpg', 'jpeg', 'png', 'gif', 'heic', 'heif'].contains(extension)) {
      icon = Icons.image;
      iconColor = Colors.blue;
    } else if (['pdf'].contains(extension)) {
      icon = Icons.picture_as_pdf;
      iconColor = Colors.red;
    } else if (['doc', 'docx'].contains(extension)) {
      icon = Icons.description;
      iconColor = Colors.blue.shade800;
    } else {
      icon = Icons.insert_drive_file;
      iconColor = Colors.grey;
    }

    return BlocBuilder<WoundClinicCubit, WoundClinicState>(
  builder: (context, state) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 28),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _fileName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '$fileSize KB • ${extension.toUpperCase()}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _selectedFile = null;
                    _fileName = 'No file chosen';
                  });
                },
              ),
            ],
          ),
        ),
        if (state.appStatus ==  AppStatus.loading) ...[
          SizedBox(height: 16),
          LinearProgressIndicator(
            value: state.uploadProgress,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF904D)),
          ),
          8.verticalSpace,
          Text(
          state.uploadProgressString??"",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  },
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add wound assessment',style: kTitleLarge.copyWith(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFFF904D),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Color(0xFFFF904D).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.cloud_upload,
                  size: 48,
                  color: Color(0xFFFF904D),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Upload Your File',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Supported formats: JPG, PNG, PDF, DOC, etc.',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF904D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  onPressed: _pickFile,
                  child: Text(
                    'Choose File',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              _buildFileInfo(),
            ],
          ),
        ),
      ),
    );
  }
}