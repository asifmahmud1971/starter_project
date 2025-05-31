import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/more/view/my_package_screen.dart';

class MoreOptionScreen extends StatefulWidget {
  @override
  _MoreOptionScreenState createState() => _MoreOptionScreenState();
}

class _MoreOptionScreenState extends State<MoreOptionScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _darkModeEnabled ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Medical Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _darkModeEnabled ? Colors.white : Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medical Profile Header
            _buildMedicalProfileHeader(),
            24.verticalSpace,
            Text('ACCOUNT SETTINGS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  letterSpacing: 1.2,
                )),
            12.verticalSpace,
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: _darkModeEnabled ? Colors.grey[800] : Colors.white,
              child: Column(
                children: [
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.user,
                    title: 'My Profile',
                    subtitle: 'Complete your professional details',
                    isComplete: false,
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.kGrayColor300,
                  ),
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.creditCard,
                    title: 'Payments & Billing',
                    subtitle: 'Manage subscription and invoices',
                    isComplete: true,
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.kGrayColor300,
                  ),
                  _buildSettingsItem(
                    onTap: () {
                      GetContext.to(TelePackageScreen());
                    },
                    icon: FontAwesomeIcons.boxesPacking,
                    title: 'My Package',
                    subtitle: 'Access your diagnostic tools',
                    isComplete: true,
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.kGrayColor300,
                  ),
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.internetExplorer,
                    title: 'Website',
                    subtitle: 'Browse our website',
                    isComplete: false,
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: AppColors.kGrayColor300,
                  ),
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.bell,
                    title: 'Notifications',
                    subtitle: 'Alerts and reminders',
                    isComplete: true,
                    isToggle: true,
                    toggleValue: _notificationsEnabled,
                    onToggle: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            _buildExpiryNotice(),
            24.verticalSpace,
            // Support Section
            _buildSupportSection(),
            16.verticalSpace,

            // Logout Button
            Center(
              child: TextButton.icon(
                icon: Icon(Icons.exit_to_app, color: Colors.red),
                label: Text('Logout',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: () {
                  // Handle logout
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalProfileHeader() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            border: Border.all(
              color: Color(0xFF0D47A1),
              width: 2,
            ),
            image: DecorationImage(
              image:
                  NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'David Jhone',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'patient1@hphospital.com',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              8.verticalSpace,
              Text(
                'Male • 54 Years',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpiryNotice() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber[100]!),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_outlined, color: Colors.amber),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subscription Expiring Soon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Your premium membership will expire in 7 days',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isComplete,
    bool isToggle = false,
    bool toggleValue = false,
    Function(bool)? onToggle,
    Function()? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: Container(
        padding: EdgeInsets.all(5.r),
        alignment: Alignment.center,
        width: 40.r,
        height: 40.r,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(
          icon,
          color: AppColors.kPrimaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      trailing: isToggle
          ? Switch(
              value: toggleValue,
              onChanged: onToggle,
              activeColor: AppColors.kPrimaryColor,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isComplete)
                  FaIcon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
                8.horizontalSpace,
                FaIcon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
      onTap: onTap,
    );
  }

  Widget _buildSupportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SUPPORT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
              letterSpacing: 1.2,
            )),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildSupportButton(
                icon: FontAwesomeIcons.lifeRing,
                label: 'Help Center',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildSupportButton(
                icon: FontAwesomeIcons.headphones,
                label: 'Contact Us',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSupportButton({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFF0D47A1).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: Color(0xFF0D47A1),
            size: 24,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
