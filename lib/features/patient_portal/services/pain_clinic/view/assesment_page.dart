import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/cubit/painClinic_cubit.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/view/add_pain.dart';
import 'package:medPilot/features/patient_portal/services/pain_clinic/widgets/pain_assessment.dart';

class AssessmentPage extends StatefulWidget {
  @override
  _AssessmentPageState createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {


  String _selectedFilter = 'All';

  @override
  void initState() {
    // TODO: implement initState
    context.read<PainClinicCubit>().getPainAssessment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PainClinicCubit, PainClinicState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF9F9F9),
          appBar: _buildAppBar(),
          body: Column(
            children: [
              //_buildFilterChips(),
              Expanded(
                child: ListView.separated(
                  padding:
                  EdgeInsets.only(top: 8, bottom: 16, left: 16.w, right: 16.w),
                  itemCount: (state.painAssessmentModel?.allPainAssessment??[]).length,
                  itemBuilder: (context, index) {
                    return PainAssessment(entry: state.painAssessmentModel?.allPainAssessment?[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.verticalSpace;
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(Icons.add, color: Colors.white),
            onPressed: () => GetContext.to(AddPainAssessmentScreen()),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(AppStrings.painAssessmentHistory.tr(),style: kTitleMedium.copyWith(),),
      elevation: 0,
    );
  }

/*  Widget _buildFilterChips() {
    final filters = ['All', 'Mild', 'Moderate', 'Severe'];

    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(filters[index]),
              selected: _selectedFilter == filters[index],
              selectedColor: AppColors.kPrimaryColor.withOpacity(0.2),
              checkmarkColor: AppColors.kPrimaryColor,
              labelStyle: TextStyle(
                color: _selectedFilter == filters[index]
                    ? AppColors.kPrimaryColor
                    : Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
              onSelected: (selected) {
                setState(() {
                  _selectedFilter = filters[index];
                });
              },
            ),
          );
        },
      ),
    );
  }*/

  void _showAddAssessmentDialog() {
    // Implement your add assessment dialog here
  }
}
