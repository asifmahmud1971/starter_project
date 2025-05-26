import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/features/profile/cubit/profile_cubit.dart';
import 'package:medPilot/features/profile/editable_profile.dart';
import '../../core/constants/app_colors.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  void initState() {
    GetContext.context.read<ProfileCubit>().faceUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const secondaryColor = Color(0xFF394294); // Deep blue
    const accentColor = Color(0xFF6C63FF); // Purple accent
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 180,
                iconTheme: IconThemeData(
                  color: Colors.white, // Back icon color
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: AppColors.kPrimaryColor.withAlpha(480),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        70.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor: AppColors.kGrayColor200,
                                backgroundImage: CachedNetworkImageProvider(
                                    "https://picsum.photos/2000" ?? ""),
                              ),
                              10.horizontalSpace,
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.profileDetails?.patientName??"",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: [
                                          _buildInfoChip(Icons.cake, '25 Yrs'),
                                          const SizedBox(width: 8),
                                          _buildInfoChip(
                                              Icons.transgender, 'Others'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, color: Colors.white),
                    ),
                    onPressed: () {
                      GetContext.to(EditAbleProfileScreen());
                    },
                  ),
                ],
              ),

              // Profile Content
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildModernSection(
                      title: 'Personal Details',
                      icon: Icons.person_outline,
                      color: accentColor,
                      children: [
                        _buildDetailRow('Date of Birth', 'April 22, 2000'),
                        _buildDetailRow('Blood Group', 'O+', isImportant: true),
                        _buildDetailRow('Marital Status', 'Single'),
                      ],
                    ),
                    _buildModernSection(
                      title: 'Contact Information',
                      icon: Icons.contact_phone_outlined,
                      color: AppColors.kPrimaryColor,
                      children: [
                        _buildDetailRow('Mobile', '+880 1717926565',
                            isPhone: true),
                        _buildDetailRow('Doctor Contact', '+880 1717926565',
                            isPhone: true),
                        _buildDetailRow('Address', '123 Medical Street, Dhaka'),
                      ],
                    ),

                    _buildModernSection(
                      title: 'Medical Information',
                      icon: Icons.medical_information,
                      color: secondaryColor,
                      children: [
                        _buildDetailRow('Allergies', 'Penicillin, Shellfish',
                            isImportant: true),
                        _buildDetailRow('Primary Diagnosis', 'Hypertension'),
                        _buildDetailRow('Co-morbidities', 'Type 2 Diabetes'),
                      ],
                    ),

                    // Emergency Section with Call Button
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.red[100]!,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.red[100],
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.emergency,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Emergency Contacts',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildDetailRow('Primary Contact', 'Mrs. Rahman'),
                            _buildDetailRow('Relationship', 'Mother'),
                            _buildDetailRow('Phone', '+880 1712345678',
                                isPhone: true),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                icon: const Icon(Icons.call),
                                label: const Text('Call Emergency Contact'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildModernSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value,
      {bool isImportant = false, bool isPhone = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isImportant ? FontWeight.w600 : FontWeight.w400,
                color: isImportant ? const Color(0xFF394294) : Colors.black87,
              ),
            ),
          ),
          if (isPhone)
            IconButton(
              icon: const Icon(Icons.phone, size: 18),
              color: const Color(0xFFFF904D),
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade300.withAlpha(10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[300]),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
