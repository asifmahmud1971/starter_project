import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

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
  TextEditingController _fromAddressController =
      TextEditingController(text: '2222+22 Kabaru, Nigeria');
  TextEditingController _toAddressController =
      TextEditingController(text: '7GJ42222+22');
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
        title: Text('Add Ambulance'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('When to Need',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _BuildSmartVitalRow(
                      label: 'Date',
                      firstField: CustomTextField(
                        controller: null,
                        radius: 8.r,
                        hint: "Date",
                        //validator: onDemandCubit.validator,
                        onPress: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            _dateController.text =
                                pickedDate.toString().split(' ')[0];
                          }
                        },
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: AppColors.kGrayColor600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _BuildSmartVitalRow(
                      label: 'Time',
                      firstField: CustomTextField(
                        controller: null,
                        radius: 8.r,
                        hint: "Time",
                        //validator: onDemandCubit.validator,
                        onPress: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            _dateController.text =
                                pickedDate.toString().split(' ')[0];
                          }
                        },
                        suffixIcon: Icon(
                          Icons.access_time_outlined,
                          color: AppColors.kGrayColor600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'From Address',
                firstField: CustomTextField(
                  controller: _fromAddressController,
                  radius: 8.r,
                  hint: "From Address",
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'To Address',
                firstField: CustomTextField(
                  controller: _toAddressController,
                  radius: 8.r,
                  hint: "To Address",
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'Note',
                firstField: CustomTextField(
                  controller: _noteController,
                  radius: 8.r,
                  hint: "Note",
                  maxLine: 3,
                  //validator: onDemandCubit.validator,
                ),
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
                      Text('Service Charges', style: kHeadLineSmall),
                      SizedBox(height: 10),
                      _BuildSmartVitalRow(
                        label: 'Total KM',
                        firstField: CustomTextField(
                          controller: _distanceController,
                          radius: 8.r,
                          hint: "Total KM (Per KM 300 TK.)",
                          //validator: onDemandCubit.validator,
                        ),
                      ),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        title: Text('Oxygen Required (Per Cy 800 TK.)',
                            style: kTitleSmall.copyWith(
                                color: AppColors.kGrayColor700)),
                        value: _oxygenRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _oxygenRequired = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: Text('Climbing Required (Per Floor 120 TK.)',
                            style: kTitleSmall.copyWith(
                                color: AppColors.kGrayColor700)),
                        value: _climbingRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _climbingRequired = value!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Waiting Charge (Per Hour TK.)',
                          style: kTitleSmall.copyWith(
                              color: AppColors.kGrayColor700),
                        ),
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
              SizedBox(height: 26),
              CustomButton(
                onTap: () {},
                title: "Submit",
                backgroundColor: Colors.orange,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildSmartVitalRow extends StatelessWidget {
  final String? label;
  final Widget firstField;
  final bool isOptional = false;

  const _BuildSmartVitalRow({
    super.key,
    this.label,
    required this.firstField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label ?? "",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
            isOptional
                ? Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      "*",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kError400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: firstField),
          ],
        ),
      ],
    );
  }
}
