import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/components/custom_text_field.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';

import '../widget/map/map_screen.dart';

class AddAmbulancePage extends StatefulWidget {
  const AddAmbulancePage({super.key});

  @override
  State createState() => _AddAmbulancePageState();
}

class _AddAmbulancePageState extends State<AddAmbulancePage> {
  bool _oxygenRequired = false;
  bool _climbingRequired = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _dateController = TextEditingController();

  final onDemand = GetContext.context.read<OnDemandServiceCubit>();

  @override
  void initState() {
    super.initState();
     onDemand.resetAddAmbulanceField();
    _dateController.text = DateTime.now().toString().split(' ')[0];
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
                        controller: onDemand.dateController,
                        radius: 8.r,
                        hint: "Date",
                        readOnly: true,
                        onPress: () async {
                          onDemand.selectDate();
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
                        controller: onDemand.timeController,
                        radius: 8.r,
                        hint: "Time",
                        //validator: onDemandCubit.validator,
                        readOnly: true,
                        onPress: () async {
                         onDemand.selectTime();
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
                  controller: onDemand.formAddressController,
                  suffixIcon: InkWell(
                    child: Icon(Icons.location_on,color: AppColors.kGrayColor800),
                  ),
                  onPress: (){
                    GetContext.to(MapLocationPicker());
                  },
                  radius: 8.r,
                  hint: "From Address",
                  readOnly: true,
                ),
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'To Address',
                firstField: CustomTextField(
                  suffixIcon: InkWell(
                    child: Icon(Icons.location_on,color: AppColors.kGrayColor800,),
                  ),
                  onPress: (){
                    GetContext.to(MapLocationPicker(isToAddress: true));
                  },
                  controller: onDemand.toAddressController,
                  radius: 8.r,
                  hint: "To Address",
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'Note',
                firstField: CustomTextField(
                  controller: onDemand.noteController,
                  radius: 8.r,
                  hint: "Note",
                  maxLine: 3,
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 24),
              Text('Service Charges', style: kHeadLineSmall),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'Total KM',
                firstField: CustomTextField(
                  controller: onDemand.distanceController,
                  radius: 8.r,
                  hint: "Total KM (Per KM 300 TK.)",
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: AppColors.kDecoration,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      CheckboxListTile(
                        title: Text('Oxygen Required (Per Cy 800 TK.)',
                            style: kTitleSmall.copyWith(
                                color: AppColors.kGrayColor700)),
                        activeColor: AppColors.kPrimaryColor,
                        value: _oxygenRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _oxygenRequired = value!;
                            onDemand.oxygenController.text = "yes";
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      CheckboxListTile(
                        title: Text('Climbing Required (Per Floor 120 TK.)',
                            style: kTitleSmall.copyWith(
                                color: AppColors.kGrayColor700)),
                        activeColor: AppColors.kPrimaryColor,
                        value: _climbingRequired,
                        onChanged: (bool? value) {
                          setState(() {
                            _climbingRequired = value!;
                            onDemand.climbingController.text = "yes";
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              _BuildSmartVitalRow(
                label: 'Floor Number',
                firstField: CustomTextField(
                  controller: onDemand.floorController,
                  radius: 8.r,
                  hint: "Floor Number",
                  //validator: onDemandCubit.validator,
                ),
              ),
              SizedBox(height: 26),
              CustomButton(
                onTap: () {
                  onDemand.addAmbulance();
                },
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
