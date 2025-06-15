import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/consultant_details.dart';

import '../../../../core/components/custom_image.dart';

class ConsultationScreen extends StatefulWidget {
  @override
  _ConsultationScreenState createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  List<Doctor> doctors = [
    Doctor(
      name: "Dr. Sazia Afrin",
      specialty: "Dermatology & Venereology",
      qualifications: "MBBS, FCPS (Dermatology)",
      hospital: "City Medical College",
      rating: 4.8,
      reviewCount: 124,
      imageUrl:
          "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
      isAvailable: true,
      nextAvailable: "Today, 4:30 PM",
    ),
    Doctor(
      name: "Dr. Rahman Khan",
      specialty: "Cardiology",
      qualifications: "MD, DM (Cardiology)",
      hospital: "National Heart Institute",
      rating: 4.9,
      reviewCount: 215,
      imageUrl:
          "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
      isAvailable: false,
      nextAvailable: "Tomorrow, 10:00 AM",
    ),
    Doctor(
      name: "Dr. Priya Sharma",
      specialty: "Pediatrics",
      qualifications: "MBBS, DCH",
      hospital: "Children's Hospital",
      rating: 4.7,
      reviewCount: 98,
      imageUrl:
          "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
      isAvailable: true,
      nextAvailable: "Today, 3:00 PM",
    ),
    Doctor(
      name: "Dr. James Wilson",
      specialty: "Orthopedics",
      qualifications: "MS (Ortho), Fellowship",
      hospital: "Bone & Joint Center",
      rating: 4.6,
      reviewCount: 176,
      imageUrl:
          "https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg",
      isAvailable: true,
      nextAvailable: "Today, 5:15 PM",
    ),
  ];

  String searchQuery = '';
  String selectedSpecialty = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredDoctors = doctors.where((doctor) {
      final matchesSearch = doctor.name
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          doctor.specialty.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesSpecialty = selectedSpecialty == 'All' ||
          doctor.specialty.contains(selectedSpecialty);
      return matchesSearch && matchesSpecialty;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Find Consultants'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                return _buildDoctorCard(filteredDoctors[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search consultant...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        ),
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
      ),
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12.r),boxShadow: [AppColors.backgroundShadow]),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () {
          GetContext.to(ConsultantDetailsScreen());
        },
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 100.r,
                  width: 100.r,
                  child: CustomImage(
                    baseUrl: doctor.imageUrl,
                    radius: 12.r,
                    size: 100.r,
                  )),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      doctor.specialty,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      doctor.qualifications,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.star, size: 16.sp, color: Colors.amber),
                        SizedBox(width: 4.w),
                        Text(
                          '${doctor.rating} (${doctor.reviewCount} reviews)',
                          style: TextStyle(fontSize: 13.sp),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: doctor.isAvailable
                          ? Colors.green[50]
                          : Colors.orange[50],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      doctor.isAvailable ? 'Available' : 'Not Available',
                      style: TextStyle(
                        color: doctor.isAvailable
                            ? Colors.green[800]
                            : Colors.orange[800],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    doctor.nextAvailable,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.kPrimaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Doctor {
  final String name;
  final String specialty;
  final String qualifications;
  final String hospital;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final bool isAvailable;
  final String nextAvailable;

  Doctor({
    required this.name,
    required this.specialty,
    required this.qualifications,
    required this.hospital,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.isAvailable,
    required this.nextAvailable,
  });
}
