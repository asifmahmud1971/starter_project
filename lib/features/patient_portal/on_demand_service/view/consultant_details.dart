import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_image.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class ConsultantDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Doctor Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildDoctorHeader(),
            SizedBox(height: 24.h),
            _buildAppointmentCard(),
            SizedBox(height: 24.h),
            _buildDetailsSection(),
            SizedBox(height: 24.h),
            _buildBookButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorHeader() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
        boxShadow: [
          AppColors.kBackGroundShadow
        ],
      ),
      child: Column(
        children: [
          CustomImage(
            baseUrl:
            "https://img.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg?semt=ais_hybrid&w=740",
            isCircle: true,
            size: 100.r,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 16.h),
          Text(
            'Dr. Sazia Afrin',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'MBBS, FCPS (Dermatology)',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            'International Fellowship in Anti-Aging',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),

          Text(
            'Assistant Professor',
            style: kTitleMedium.copyWith(color: AppColors.kPrimaryColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Department of Dermatology & Venereology',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          AppColors.kBackGroundShadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Last Appointment',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20.sp, color: AppColors.kPrimaryColor),
              SizedBox(width: 8.w),
              Text(
                '12 June 2023',
                style: TextStyle(fontSize: 14.sp),
              ),
              Spacer(),
              Icon(Icons.access_time, size: 20.sp, color: AppColors.kPrimaryColor),
              SizedBox(width: 8.w),
              Text(
                '10:30 AM',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(color: AppColors.kGrayColor300,),
          SizedBox(height: 12.h),
          Text(
            'Next Available',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20.sp, color: AppColors.kPrimaryColor),
              SizedBox(width: 8.w),
              Text(
                '15 June 2023',
                style: TextStyle(fontSize: 14.sp),
              ),
              Spacer(),
              Icon(Icons.access_time, size: 20.sp, color: AppColors.kPrimaryColor),
              SizedBox(width: 8.w),
              Text(
                '02:00 PM',
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          AppColors.kBackGroundShadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Professional Details',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
          SizedBox(height: 16.h),
          _buildDetailItem('Specialization', 'Dermatology & Cosmetology'),
          _buildDetailItem('Experience', '8 years'),
          _buildDetailItem('Languages', 'English, Bengali, Hindi'),
          _buildDetailItem('Hospital', 'City Medical College & Hospital'),
          _buildDetailItem('Consultation Fee', '\$50'),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            margin: EdgeInsets.only(top: 4.h, right: 8.w),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kPrimaryColor,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 2,
          ),
          onPressed: () {
            // Book appointment
          },
          child: Text(
            'Book Appointment',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
