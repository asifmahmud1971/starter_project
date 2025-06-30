import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart'
    show FontSize, Html, Margins, Style;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_content.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/consultants_response.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/consultant_details.dart';

import '../../../../core/components/custom_image.dart';

class ConsultationScreen extends StatefulWidget {
  const ConsultationScreen({super.key});

  @override
  State createState() => _ConsultationScreenState();
}

class _ConsultationScreenState extends State<ConsultationScreen> {
  String searchQuery = '';
  String selectedSpecialty = 'All';

  final OnDemandServiceCubit onDemandCubit =
      GetContext.context.read<OnDemandServiceCubit>();

  @override
  void initState() {
    onDemandCubit.getConsultants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
/*    final filteredDoctors = onDemandCubit.state.consultantsResponse?.doctorList?.where((doctor) {
      final matchesSearch = doctor.name
          !.toLowerCase()
          .contains(searchQuery.toLowerCase()) ||
          doctor.specialty!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesSpecialty = selectedSpecialty == 'All' ||
          doctor.specialty!.contains(selectedSpecialty);
      return matchesSearch && matchesSpecialty;
    }).toList();*/

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Find Consultants'),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
        builder: (context, state) {
          return Column(
            children: [
             // _buildSearchBar(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  itemCount: state.consultantsResponse?.doctorList?.length,
                  itemBuilder: (context, index) {
                    ConDoctor? doctor =
                        state.consultantsResponse?.doctorList?.elementAt(index);

                    return _buildDoctorCard(doctor: doctor);
                  },
                ),
              ),
            ],
          );
        },
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

  Widget _buildDoctorCard({ConDoctor? doctor}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [AppColors.backgroundShadow]),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () {
          GetContext.to(ConsultantDetailsScreen(
            doctorList: doctor,
          ));
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
                    baseUrl: "https://my.medpilot.app/${doctor?.image ?? ""}",
                    radius: 12.r,
                    size: 100.r,
                  )),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor?.name ?? "",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      capitalizeFirstLetter(doctor?.specialty ?? ""),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),

                    SizedBox(height: 4.h),
                    Text(
                      capitalizeFirstLetter(doctor?.qualifications ?? ""),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                 /*   ClipRect(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        constraints: BoxConstraints(
                          maxHeight:
                              40, // approx height for 2 lines with fontSize 16
                        ),
                        child: Html(
                          data: doctor?.qualifications ?? "",
                          style: {
                            "p": Style(
                              fontSize: FontSize(10),
                              margin: Margins.zero,
                            ),
                            "strong": Style(
                              fontWeight: FontWeight.normal,
                            ),
                          },
                        ),
                      ),
                    ),*/
                    /*Html(
                      data: doctorList?.description??"",
                      style: {
                        "p": Style(fontSize: FontSize(16)),
                        "strong": Style(fontWeight: FontWeight.bold),
                      },
                    ),*/
                    /*         Text(
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
                        Flexible(
                          child: Text(
                            '${doctor.rating} (${doctor.reviewCount} reviews)',
                            style: TextStyle(fontSize: 13.sp),
                          ),
                        ),


                      ],
                    ),*/
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
                      color: ("1" ?? "0") == "1"
                          ? Colors.green[50]
                          : Colors.orange[50],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      ("1" ?? "0") == "1" ? 'Available' : 'Not Available',
                      style: TextStyle(
                        color: ("1" ?? "0") == "1"
                            ? Colors.green[800]
                            : Colors.orange[800],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  /*  Text(
                    doctorList?.status??"0",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),*/
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

