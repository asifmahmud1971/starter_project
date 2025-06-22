import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/staff_portal/pescription/cubit/staff_prescription_cubit.dart';

class Patient {
  final String id;
  final String name;
  final int age;

  Patient({required this.id, required this.name, required this.age});
}

class AnimatedPatientDropdown extends StatefulWidget {
  @override
  _AnimatedPatientDropdownState createState() =>
      _AnimatedPatientDropdownState();
}

class _AnimatedPatientDropdownState extends State<AnimatedPatientDropdown> {
  bool _isExpanded = false;
  final List<Patient> _patients = [
    Patient(id: '14', name: 'John Doe', age: 14),
    Patient(id: '14', name: 'Jane Smith', age: 15),
    Patient(id: '12', name: 'Robert Johnson', age: 14),
    Patient(id: '15', name: 'Emily Davis', age: 12),
  ];
  Patient? _selectedPatient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          AppColors.kBackGroundShadow
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header/Toggle Button
          ListTile(
            title: Text(
              _selectedPatient?.name ?? 'Select a patient',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _selectedPatient != null ? Colors.black : Colors.grey,
              ),
            ),
            trailing: Icon(
              _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: AppColors.kPrimaryColor,
            ),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),

          // Animated Dropdown Content
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isExpanded ? 200 : 0,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _patients.length,
              itemBuilder: (context, index) {
                final patient = _patients[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[100],
                    child: Text(patient.id),
                  ),
                  title: Text(
                    patient.name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text('Age: ${patient.age}'),
                  onTap: () {
                    setState(() {
                      _selectedPatient = patient;
                      _isExpanded = false;
                    });
                    context.read<StaffPrescriptionCubit>().getStaffPrescription(patientId: _selectedPatient?.id);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}