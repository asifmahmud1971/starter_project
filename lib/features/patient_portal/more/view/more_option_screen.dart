import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medPilot/core/constants/app_colors.dart';

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
        title: Text('Medical Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _darkModeEnabled ? Colors.white : Colors.white,
            )),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor, // Medical blue color
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Medical Profile Header
            _buildMedicalProfileHeader(),
            24.verticalSpace,

          /*  // Quick Actions
            Text('QUICK ACTIONS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500],
                  letterSpacing: 1.2,
                )),*/
            /*SizedBox(height: 12),
            _buildQuickActions(),*/

            // Account Settings
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
                    title: 'Medical Profile',
                    subtitle: 'Complete your professional details',
                    isComplete: false,
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20,color: AppColors.kGrayColor300,),
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.creditCard,
                    title: 'Payments & Billing',
                    subtitle: 'Manage subscription and invoices',
                    isComplete: true,
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20,color: AppColors.kGrayColor300,),
                  _buildSettingsItem(
                    icon: FontAwesomeIcons.briefcaseMedical,
                    title: 'Medical Tools',
                    subtitle: 'Access your diagnostic tools',
                    isComplete: true,
                  ),
                  Divider(height: 1, indent: 20, endIndent: 20,color: AppColors.kGrayColor300,),
                  _buildSettingsItem(
                    icon: Icons.notifications_active,
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
                  Divider(height: 1, indent: 20, endIndent: 20,color: AppColors.kGrayColor300,),
                  _buildSettingsItem(
                    icon: Icons.dark_mode,
                    title: 'Dark Mode',
                    subtitle: 'Better for low-light environments',
                    isComplete: true,
                    isToggle: true,
                    toggleValue: _darkModeEnabled,
                    onToggle: (value) {
                      setState(() {
                        _darkModeEnabled = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Support Section
            _buildSupportSection(),
            SizedBox(height: 16),

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
              image: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
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
                'Dr. Hasan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Cardiologist',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '4.8 (125 reviews)',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFF0D47A1).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(
          icon,
          color: Color(0xFF0D47A1),
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
        activeColor: Color(0xFF0D47A1),
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
          SizedBox(width: 8),
          FaIcon(
            Icons.chevron_right,
            color: Colors.grey,
          ),
        ],
      ),
      onTap: () {
        // Handle navigation
      },
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