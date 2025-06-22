import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/common_background.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/features/patient_portal/home/widgets/call_card.dart';
import 'package:medPilot/features/patient_portal/home/widgets/top_bar.dart';
import 'package:medPilot/features/staff_portal/view/staff_portal_service_list.dart';
import 'package:medPilot/generated/assets.dart';

import '../../patient_portal/home/cubit/home_cubit.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({super.key});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreenState();
}

class _StaffHomeScreenState extends State<StaffHomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getStaffPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonBackground(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          children: [
            70.verticalSpace,
            _buildSmartHeader(),
            SizedBox(height: 24.h),
            _buildPriorityAlerts(),
            SizedBox(height: 24.h),
            StaffPortalServiceList(),
            SizedBox(height: 16.h),
            _buildTaskOverview(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmartHeader() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      color: Colors.blue[50],
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning,',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Dr. Smith',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'You have 3 priority tasks today',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ),
            CustomSvg(icon: Assets.medGoodMorning,size: 100.r,),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityAlerts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.warning_amber_rounded,
                color: Colors.orange[800], size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              'Priority Alerts',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange[100]!),
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.orange[50],
          ),
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Icon(Icons.medication, color: Colors.orange[800], size: 24.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Medicine Alert',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      'Patient #1234 missed their medication',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                ),
                onPressed: () {},
                child: Text('Resolve'),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildTaskOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View All'),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              _buildTaskItem('Morning Rounds', '8:00 AM', true),
              _buildTaskItem('Patient Consultations', '9:30 AM', false),
              _buildTaskItem('Team Meeting', '2:00 PM', false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(String title, String time, bool completed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: completed ? Colors.green : Colors.grey,
                width: 2,
              ),
            ),
            child: completed
                ? Icon(Icons.check, size: 16.sp, color: Colors.green)
                : null,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    decoration: completed ? TextDecoration.lineThrough : null,
                    color: completed ? Colors.grey : Colors.black,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
