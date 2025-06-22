import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class TelePackageScreen extends StatefulWidget {
  const TelePackageScreen({super.key});

  @override
  State createState() => _TelePackageScreenState();
}

class _TelePackageScreenState extends State<TelePackageScreen> {
  String? _selectedPackage;
  String? _selectedPaymentMethod;
  final List<Map<String, dynamic>> _packages = [
    {'name': 'Basic', 'price': '\$9.99/month', 'features': '5 consultations'},
    {
      'name': 'Standard',
      'price': '\$19.99/month',
      'features': '15 consultations'
    },
    {
      'name': 'Premium',
      'price': '\$29.99/month',
      'features': 'Unlimited consultations'
    },
  ];

  final List<String> _paymentMethods = ['Pay Later', 'bKash', 'Card/Others'];

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
      body: SingleChildScrollView(
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
                    Row(
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
            ..._packages
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
              children: _paymentMethods
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
                        _showConfirmationDialog();
                      },
                child: Text(
                  'Subscribe Now',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageOption(Map<String, dynamic> package) {
    bool isSelected = _selectedPackage == package['name'];
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
            _selectedPackage = package['name'];
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
                    color: isSelected ? AppColors.kPrimaryColor : Colors.grey[300]!,
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
                      package['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      package['price'],
                      style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      package['features'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if (package['name'] == 'Premium')
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
      case 'bKash':
        icon = Icons.mobile_friendly;
        iconColor = Colors.pink;
        break;
      case 'Card/Others':
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
          color: isSelected ? AppColors.kPrimaryColor.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.kPrimaryColor : Colors.grey[200]!,
            width:  1,
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


  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            'Confirm Subscription',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You are subscribing to:',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Text(
                _selectedPackage!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Payment method:',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 8),
              Text(
                _selectedPaymentMethod!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 24),
              if (_selectedPaymentMethod == 'bKash')
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'bKash Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                _showSuccessDialog();
              },
              child: Text('Confirm Payment'),
            ),
          ],
        );
      },
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
