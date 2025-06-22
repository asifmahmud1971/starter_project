import 'package:flutter/material.dart';

class AddAmbulancePage extends StatefulWidget {
  const AddAmbulancePage({super.key});

  @override
  State createState() => _AddAmbulancePageState();
}

class _AddAmbulancePageState extends State<AddAmbulancePage> {
  String _urgency = 'immediate';
  bool _oxygenRequired = false;
  bool _climbingRequired = false;
  bool _waitingCharge = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _fromAddressController = TextEditingController(text: '2222+22 Kabaru, Nigeria');
  TextEditingController _toAddressController = TextEditingController(text: '7GJ42222+22');
  TextEditingController _noteController = TextEditingController(text: 'Note');
  TextEditingController _distanceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set current date and time as default
    _dateController.text = DateTime.now().toString().split(' ')[0];
    //_timeController.text = TimeOfDay.now().format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🍟 Ambulance Request'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              // Navigate to show all requests
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('When to Need', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio(
                    value: 'immediate',
                    groupValue: _urgency,
                    onChanged: (value) {
                      setState(() {
                        _urgency = value.toString();
                      });
                    },
                  ),
                  Text('Immediate'),
                  SizedBox(width: 20),
                  Radio(
                    value: 'scheduled',
                    groupValue: _urgency,
                    onChanged: (value) {
                      setState(() {
                        _urgency = value.toString();
                      });
                    },
                  ),
                  Text('Scheduled'),
                ],
              ),
              SizedBox(height: 16),

              // Date and Time Row
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          _dateController.text = pickedDate.toString().split(' ')[0];
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.access_time),
                      ),
                      readOnly: true,
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          _timeController.text = pickedTime.format(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // From Address
              TextFormField(
                controller: _fromAddressController,
                decoration: InputDecoration(
                  labelText: 'From Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // To Address
              TextFormField(
                controller: _toAddressController,
                decoration: InputDecoration(
                  labelText: 'To Address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // Note
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(
                  labelText: 'Note',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 24),

              // Charges Section
              Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Service Charges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 12),

                      // Distance
                      TextFormField(
                        controller: _distanceController,
                        decoration: InputDecoration(
                          labelText: 'Total KM (Per KM 300 TK.)',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                      ),
                      SizedBox(height: 12),

                      // Checkboxes
                      CheckboxListTile(
                        title: Text('Oxygen Required (Per Cy 800 TK.)'),
                        value: _oxygenRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _oxygenRequired = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      CheckboxListTile(
                        title: Text('Climbing Required (Per Floor 120 TK.)'),
                        value: _climbingRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _climbingRequired = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),

                      CheckboxListTile(
                        title: Text('Waiting Charge (Per Hour TK.)'),
                        value: _waitingCharge,
                        onChanged: (bool? value) {
                          setState(() {
                            _waitingCharge = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),
              Text('* It can be modified.', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 16),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with submission
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Request Submitted')),
                      );
                    }
                  },
                  child: Text('Submit', style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/*
  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _fromAddressController.dispose();
    _toAddressController.dispose();
    _noteController.dispose();
    _distanceController.dispose();
    super.dispose();
  }*/
}
