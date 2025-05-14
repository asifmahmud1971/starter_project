import 'package:flutter/material.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/dashboard/view/patient_dashboard_screen.dart';
import 'package:medPilot/features/patient_portal/home/view/patient_home_screen.dart';
import 'package:medPilot/generated/assets.dart';

class StaffDashboardScreen extends StatefulWidget {
  const StaffDashboardScreen({super.key});

  @override
  State<StaffDashboardScreen> createState() => _StaffDashboardScreenState();
}

class _StaffDashboardScreenState extends State<StaffDashboardScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientDashboardScreen(),
    );
  }
}
