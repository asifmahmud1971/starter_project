import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class AddFollowUpScreen extends StatefulWidget {
  const AddFollowUpScreen({super.key});

  @override
  State<AddFollowUpScreen> createState() => _AddFollowUpScreenState();
}

class _AddFollowUpScreenState extends State<AddFollowUpScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  // Controllers
  final TextEditingController _bpHighController = TextEditingController();
  final TextEditingController _bpLowController = TextEditingController();
  final TextEditingController _pulseController = TextEditingController();
  final TextEditingController _saturationController = TextEditingController();
  final TextEditingController _oxygenController = TextEditingController();
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController _intakeController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();
  final TextEditingController _insulinController = TextEditingController();
  final TextEditingController _bloodSugarController = TextEditingController();

  // Dropdown values
  String? _shortnessOfBreath;
  String? _bowelMovement;
  String? _functionalStatus;

  // Physical symptoms
  final Map<String, bool> _physicalSymptoms = {
    'Pain': false,
    'Nausea': false,
    'Breathlessness': false,
    'Constipation': false,
    'Restlessness': false,
    'Drowsiness': false,
    'Dyspepsia': false,
    'Cough': false,
    'Swelling': false,
    'Fever': false,
    'Urinary Problem': false,
    'Vomiting': false,
    'Lymphedema': false,
    'Bedstore': false,
    'Poor Appetite': false,
    'Sleep disturbance': false,
    'No Complain': false,
    'Others': false,
  };

  // Color indicators based on values
  Color _getBPColor() {
    final high = int.tryParse(_bpHighController.text) ?? 0;
    final low = int.tryParse(_bpLowController.text) ?? 0;

    if (high > 140 || low > 90) return Colors.orange;
    if (high > 160 || low > 100) return Colors.red;
    if (high < 90 || low < 60) return Colors.blue;
    return Colors.green;
  }

  Color _getPulseColor() {
    final pulse = int.tryParse(_pulseController.text) ?? 0;
    if (pulse > 100) return Colors.orange;
    if (pulse > 120) return Colors.red;
    if (pulse < 60) return Colors.blue;
    return Colors.green;
  }

  Color _getSaturationColor() {
    final sat = int.tryParse(_saturationController.text) ?? 0;
    if (sat < 95) return Colors.orange;
    if (sat < 90) return Colors.red;
    return Colors.green;
  }

  Color _getTempColor() {
    final temp = double.tryParse(_tempController.text) ?? 0;
    if (temp > 99.5) return Colors.orange;
    if (temp > 100.4) return Colors.red;
    if (temp < 97.0) return Colors.blue;
    return Colors.green;
  }

  Color _getBloodSugarColor() {
    final sugar = double.tryParse(_bloodSugarController.text) ?? 0;
    if (sugar > 7.8) return Colors.orange;
    if (sugar > 11.1) return Colors.red;
    if (sugar < 4.0) return Colors.blue;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Patient Follow-Up',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.kPrimaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showHelpDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Time Card
              _buildDateTimeCard(),
              const SizedBox(height: 20),

              // Vital Signs Section
              _buildSectionHeader('Vital Signs', Icons.monitor_heart),
              _buildVitalSignsCard(),
              const SizedBox(height: 20),

              // Physical Symptoms Section
              _buildSectionHeader('Physical Symptoms', Icons.medical_services),
              _buildPhysicalSymptomsCard(),
              const SizedBox(height: 20),

              // Functional Status Section
              _buildSectionHeader('Functional Status', Icons.accessibility),
              _buildFunctionalStatusCard(),
              const SizedBox(height: 30),

              // Save Button
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save, size: 20),
                  label: const Text('SAVE FOLLOW-UP',
                      style: TextStyle(letterSpacing: 1)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.teal.shade700,
                    foregroundColor: Colors.white,
                    elevation: 4,
                  ),
                  onPressed: _saveFollowUp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [AppColors.kBackGroundShadow]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.teal),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Date & Time',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.calendar_month, size: 18),
                          label: Text(
                            DateFormat('MMM dd, yyyy').format(_selectedDate),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.teal.shade50,
                            foregroundColor: Colors.teal.shade800,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => _selectDate(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton.icon(
                          icon: const Icon(Icons.access_time, size: 18),
                          label: Text(_selectedTime.format(context)),
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.teal.shade50,
                            foregroundColor: Colors.teal.shade800,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () => _selectTime(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.teal.shade700),
          const SizedBox(width: 8),
          Text(title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              )),
        ],
      ),
    );
  }

  Widget _buildVitalSignsCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [AppColors.kBackGroundShadow]),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Blood Pressure
            _buildSmartVitalRow(
              label: 'Blood Pressure (mmHg)',
              firstField: _buildSmartNumberField(
                  _bpHighController, 'High', '120', _getBPColor),
              secondField: _buildSmartNumberField(
                  _bpLowController, 'Low', '80', _getBPColor),
              color: _getBPColor(),
            ),
            const Divider(height: 24, thickness: 0.5),

            // Pulse and Saturation
            _buildSmartVitalRow(
              label: 'Pulse (bpm) / Saturation (%)',
              firstField: _buildSmartNumberField(
                  _pulseController, 'Pulse', '72', _getPulseColor),
              secondField: _buildSmartNumberField(_saturationController,
                  'Saturation', '98', _getSaturationColor),
              color: _getPulseColor(),
            ),
            const Divider(height: 24, thickness: 0.5),

            // Oxygen and Temperature
            _buildSmartVitalRow(
              label: 'Oxygen (L) / Temp (°F)',
              firstField: _buildSmartNumberField(
                  _oxygenController, 'Oxygen', '2', _getTempColor),
              // Problem here
              secondField: _buildSmartNumberField(
                  _tempController, 'Temp', '98.6', _getTempColor),
              // And here
              color: _getTempColor(),
            ),
            const Divider(height: 24, thickness: 0.5),

            // Intake and Output
            _buildSmartVitalRow(
              label: 'Intake (ml) / Output (ml)',
              firstField: _buildSmartNumberField(
                  _intakeController, 'Intake', '1500', _getTempColor),
              secondField: _buildSmartNumberField(
                  _outputController, 'Output', '1200', _getTempColor),
              color: Colors.teal,
            ),
            const Divider(height: 24, thickness: 0.5),

            // Insulin and Blood Sugar
            _buildSmartVitalRow(
              label: 'Insulin (units) / Blood Sugar (mmol/L)',
              firstField: _buildSmartNumberField(
                  _insulinController, 'Insulin', '8', _getTempColor),
              secondField: _buildSmartNumberField(_bloodSugarController,
                  'Blood Sugar', '5.5', _getBloodSugarColor),
              color: _getBloodSugarColor(),
            ),
            Divider(height: 24.h, thickness: 0.5),
            _buildSmartDropdown(
              value: _shortnessOfBreath,
              hint: 'Shortness of Breath',
              items: ['None', 'Mild', 'Moderate', 'Severe'],
              icon: Icons.air,
            ),
            10.verticalSpace,
            _buildSmartDropdown(
              value: _bowelMovement,
              hint: 'Bowel Movement',
              items: ['Normal', 'Constipated', 'Diarrhea', 'Irregular'],
              icon: Icons.clean_hands,
            )
            // Shortness of Breath and Bowel Movement
          ],
        ),
      ),
    );
  }

  Widget _buildPhysicalSymptomsCard() {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],
          borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _physicalSymptoms.keys.map((symptom) {
                return ChoiceChip(
                  label: Text(symptom),
                  selected: _physicalSymptoms[symptom]!,
                  onSelected: (selected) {
                    setState(() {
                      _physicalSymptoms[symptom] = selected;
                      if (selected && symptom == 'No Complain') {
                        // If "No Complain" is selected, deselect all others
                        for (var key in _physicalSymptoms.keys) {
                          if (key != 'No Complain') {
                            _physicalSymptoms[key] = false;
                          }
                        }
                      } else if (selected && symptom != 'No Complain') {
                        // If any other symptom is selected, deselect "No Complain"
                        _physicalSymptoms['No Complain'] = false;
                      }
                    });
                  },
                  selectedColor: Colors.teal.shade100,
                  backgroundColor: Colors.grey.shade100,
                  labelStyle: TextStyle(
                    color: _physicalSymptoms[symptom]!
                        ? Colors.teal.shade800
                        : Colors.grey.shade800,
                    fontWeight: _physicalSymptoms[symptom]!
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: _physicalSymptoms[symptom]!
                          ? Colors.teal.shade300
                          : Colors.grey.shade300,
                    ),
                  ),
                );
              }).toList(),
            ),
            if (_physicalSymptoms['Others']!)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Specify other symptoms',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionalStatusCard() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildSmartDropdown(
          value: _functionalStatus,
          hint: 'Select Functional Status',
          items: [
            'Independent - No assistance needed',
            'Requires Assistance - Some help needed',
            'Dependent - Full assistance required',
            'Bedridden - Confined to bed',
            'Wheelchair-bound - Uses wheelchair'
          ],
          icon: Icons.directions_walk,
        ),
      ),
    );
  }

  Widget _buildSmartVitalRow({
    required String label,
    required Widget firstField,
    required Widget secondField,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            // Icon(Icons.circle, size: 12, color: color),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Expanded(child: firstField),
            const SizedBox(width: 16),
            Expanded(child: secondField),
          ],
        ),
      ],
    );
  }

  Widget _buildSmartNumberField(
    TextEditingController controller,
    String label,
    String hint,
    Color? Function() getColor,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //suffixIcon: Icon(Icons.circle, size: 12, color: getColor()),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: TextStyle(
        color: getColor(),
        fontWeight: FontWeight.w500,
      ),
      onChanged: (value) => setState(() {}),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }

  Widget _buildSmartDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required IconData icon,
  }) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            // 🔧 This line fixes the overflow
            decoration: InputDecoration(
              labelText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(icon, color: Colors.teal.shade700),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  maxLines: 1,
                ),
              );
            }).toList(),
            onChanged: (value) => setState(() {
              if (hint.contains('Shortness')) {
                _shortnessOfBreath = value;
              } else if (hint.contains('Bowel')) {
                _bowelMovement = value;
              } else {
                _functionalStatus = value;
              }
            }),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an option';
              }
              return null;
            },
            style: TextStyle(color: Colors.grey.shade800),
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            icon: Icon(Icons.arrow_drop_down, color: Colors.teal.shade700),
            elevation: 2,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal.shade700,
              onPrimary: Colors.white,
              onSurface: Colors.grey.shade800,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal.shade700,
              onPrimary: Colors.white,
              onSurface: Colors.grey.shade800,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Help'),
          content: const Text(
            'Fill in all the patient\'s vital signs and symptoms. '
            'The color indicators show whether values are normal (green), '
            'concerning (orange), or critical (red).',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _saveFollowUp() {
    if (_formKey.currentState!.validate()) {
      // Process and save the data
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Follow-up record saved successfully.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Return to previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _bpHighController.dispose();
    _bpLowController.dispose();
    _pulseController.dispose();
    _saturationController.dispose();
    _oxygenController.dispose();
    _tempController.dispose();
    _intakeController.dispose();
    _outputController.dispose();
    _insulinController.dispose();
    _bloodSugarController.dispose();
    super.dispose();
  }
}
