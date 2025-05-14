import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EiditableProfileScreen extends StatefulWidget {
  const EiditableProfileScreen({super.key});

  @override
  State<EiditableProfileScreen> createState() => _EiditableProfileScreenState();
}

class _EiditableProfileScreenState extends State<EiditableProfileScreen> {
  // Patient data variables
  String patientName = "Patient 1";
  String age = "25 Yrs 0 M 23 D";
  String gender = "Others";
  String mobileNo = "01717926565";
  String doctorContact = "01717926565";
  String dob = "04/22/2000";
  String bloodGroup = "";
  String maritalStatus = "";
  String address = "";
  String emergencyContact = "";
  String emergencyPhone = "";
  String allergies = "";
  String diagnosis = "";
  String comorbidities = "";

  bool isEditing = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFFF904D);
    const secondaryColor = Color(0xFF394294);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Patient Profile'),
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            onPressed: () {
              if (isEditing) {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() => isEditing = false);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated successfully')),
                  );
                }
              } else {
                setState(() => isEditing = true);
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Profile Header
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [secondaryColor, primaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 46,
                            backgroundImage: const AssetImage('assets/patient_avatar.png'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        isEditing
                            ? TextFormField(
                          initialValue: patientName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            filled: false,
                          ),
                          onSaved: (value) => patientName = value ?? '',
                          validator: (value) =>
                          value!.isEmpty ? 'Name cannot be empty' : null,
                        )
                            : Text(
                          patientName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              // Personal Information
              _buildEditableSection(
                icon: Icons.person,
                title: "Personal Information",
                color: secondaryColor,
                children: [
                  _buildEditableField("Age", age, (value) => age = value ?? ''),
                  _buildEditableField("Gender", gender, (value) => gender = value ?? ''),
                  _buildEditableField("Date of Birth", dob, (value) => dob = value ?? ''),
                  _buildEditableField(
                      "Blood Group", bloodGroup, (value) => bloodGroup = value ?? ''),
                  _buildEditableField(
                      "Marital Status", maritalStatus, (value) => maritalStatus = value ?? ''),
                ],
              ),

              // Contact Information
              _buildEditableSection(
                icon: Icons.phone,
                title: "Contact Information",
                color: primaryColor,
                children: [
                  _buildEditableField(
                      "Mobile No", mobileNo, (value) => mobileNo = value ?? '',
                      keyboardType: TextInputType.phone),
                  _buildEditableField("Doctor Contact", doctorContact,
                          (value) => doctorContact = value ?? '',
                      keyboardType: TextInputType.phone),
                  _buildEditableField(
                      "Address", address, (value) => address = value ?? '',
                      maxLines: 2),
                ],
              ),

              // Emergency Contacts
              _buildEditableSection(
                icon: Icons.emergency,
                title: "Emergency Contacts",
                color: Colors.red,
                children: [
                  _buildEditableField("Contact Person", emergencyContact,
                          (value) => emergencyContact = value ?? ''),
                  _buildEditableField("Contact Number", emergencyPhone,
                          (value) => emergencyPhone = value ?? '',
                      keyboardType: TextInputType.phone),
                ],
              ),

              // Medical Information
              _buildEditableSection(
                icon: Icons.medical_information,
                title: "Medical Information",
                color: Colors.green,
                children: [
                  _buildEditableField(
                      "Allergies", allergies, (value) => allergies = value ?? '',
                      maxLines: 2),
                  _buildEditableField(
                      "Primary Diagnosis", diagnosis, (value) => diagnosis = value ?? ''),
                  _buildEditableField("Co-morbidities", comorbidities,
                          (value) => comorbidities = value ?? '',
                      maxLines: 2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableSection({
    required IconData icon,
    required String title,
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
            color: Colors.grey.withOpacity(0.1),
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
                    color: color.withOpacity(0.2),
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

  Widget _buildEditableField(
      String label,
      String value,
      Function(String?) onSaved, {
        TextInputType keyboardType = TextInputType.text,
        int maxLines = 1,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          isEditing
              ? TextFormField(
            initialValue: value,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF394294)),
              ),
            ),
            onSaved: onSaved,
          )
              : Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value.isEmpty ? "Not specified" : value,
              style: TextStyle(
                color: value.isEmpty ? Colors.grey[400] : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}