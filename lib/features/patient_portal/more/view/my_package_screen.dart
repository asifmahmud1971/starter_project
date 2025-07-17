import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';

import '../../on_demand_service/model/tele_package_response.dart';

class TelePackageScreen extends StatefulWidget {
  const TelePackageScreen({super.key});

  @override
  State createState() => _TelePackageScreenState();
}

class _TelePackageScreenState extends State<TelePackageScreen> {
  String? _selectedPackage;
  String? _selectedPackageId;
  String? _selectedPaymentMethod;


  final OnDemandServiceCubit onDemandCubit =
  GetContext.context.read<OnDemandServiceCubit>();

  @override
  void initState() {
    onDemandCubit.getCurrentTelePackage();
    onDemandCubit.getTelePackege();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Telemedicine Package',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey[200]!),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.currentTelePackage?.currentTelePackage=="not_active"?Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.orange),
                            SizedBox(width: 8),
                            Text(
                              'No Active Package',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ):Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.green),
                            SizedBox(width: 8),
                            Text(
                              'No Active Package',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Subscribe to a telemedicine package to start consulting with doctors remotely',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                // Package Selection
                Text(
                  'SELECT YOUR PACKAGE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                ...(state.telePackage?.packages??[])
                    .map((package) => _buildPackageOption(package))
                    .toList(),
                SizedBox(height: 24),

                // Payment Method
                Text(
                  'PAYMENT METHOD',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: (state.currentTelePackage?.paymentOption??[])
                      .map((method) =>
                      Expanded(child: _buildPaymentMethodHorizontal(method)))
                      .toList(),
                ),
                SizedBox(height: 32),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: _selectedPackage == null
                        ? null
                        : () {
                      onDemandCubit.upgradeTelePackage(packageId: _selectedPackageId,paymentOption: _selectedPaymentMethod);
                      //_showConfirmationDialog();
                    },
                    child: Text(
                      'Subscribe Now',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPackageOption(Packages? package) {
    bool isSelected = _selectedPackage == package?.name;
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? AppColors.kPrimaryColor : Colors.grey[200]!,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          setState(() {
            _selectedPackage = package?.name;
            _selectedPackageId = package?.id.toString();
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.kPrimaryColor : Colors
                        .grey[300]!,
                    width: 1,
                  ),
                ),
                child: isSelected
                    ? Icon(
                  Icons.check,
                  size: 16,
                  color: AppColors.kPrimaryColor,
                )
                    : null,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      package?.name??"",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      package?.price??"",
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      package?.status??"",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (package?.name == 'Premium')
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.amber[800],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodHorizontal(String method) {
    bool isSelected = _selectedPaymentMethod == method;
    IconData icon;
    Color iconColor;

    switch (method) {
      case 'pay_online':
        icon = Icons.credit_card;
        iconColor = Colors.blue;
        break;
      default:
        icon = Icons.schedule;
        iconColor = Colors.green;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = method;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor.withOpacity(0.1) : Colors
              .white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.kPrimaryColor : Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor.withOpacity(0.1),
                    ),
                    child: Icon(icon, color: iconColor),
                  ),
                  SizedBox(height: 8),
                  Text(
                    method,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Radio<String>(
                value: method,
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value;
                  });
                },
                activeColor: AppColors.kPrimaryColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            )
          ],
        ),
      ),
    );
  }



  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),
                SizedBox(height: 16),
                Text(
                  'Subscription Successful!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your telemedicine package is now active',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text('Start Consulting'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
