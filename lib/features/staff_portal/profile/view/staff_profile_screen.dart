import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/staff_portal/profile/view/edit_staff_profile_screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Information'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppColors.kPrimaryColor),
            onPressed: () {
              GetContext.to(EditProfileScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Patient Header Card
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.kWhiteColor,
                  boxShadow: [AppColors.backgroundShadow]
              ),
              margin: EdgeInsets.only(bottom: 10.h),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.kPrimaryColor.withValues(alpha: 0.3), width: 3),
                      ),
                      child:  CircleAvatar(
                        radius: 36.r,
                        backgroundColor: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                        child: Icon(
                          Icons.person_outline,
                          size: 40.r,
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'fff',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Patient ID: 3454534',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Active',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Information Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Info Cards
            _buildInfoCard(
              icon: Icons.cake_outlined,
              title: 'Date of Birth',
              value: '12/31/2024',
              color: const Color(0xFF3498DB),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.wc_outlined,
              title: 'Gender',
              value: 'Male',
              color: const Color(0xFF9B59B6),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.home_outlined,
              title: 'Present Address',
              value: 'tdhf',
              color: const Color(0xFF16A085),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.phone_outlined,
              title: 'Phone Number',
              value: '',
              color: const Color(0xFFE67E22),
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.email_outlined,
              title: 'Email',
              value: '',
              color: const Color(0xFFE74C3C),
            ),
            const SizedBox(height: 24),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Information saved'),
                      backgroundColor: Color(0xFF16A085),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColors.kWhiteColor,
        boxShadow: [AppColors.backgroundShadow]
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  value.isNotEmpty
                      ? Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C3E50),
                    ),
                  )
                      : Text(
                    'Not provided',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}