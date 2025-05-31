import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentCardScreenState createState() => _PaymentCardScreenState();
}

class _PaymentCardScreenState extends State<PaymentScreen> {
  int _currentTabIndex = 0;
  final int _itemsPerPage = 5;

  final List<Map<String, dynamic>> _allDuePayments = [
    {
      'invoiceNo': '202505-90',
      'date': '08-05-2025',
      'amount': 125.00,
      'status': 'Pending',
      'service': 'Consultation',
      'doctor': 'Dr. Smith'
    },
    {
      'invoiceNo': '202505-91',
      'date': '08-05-2025',
      'amount': 85.50,
      'status': 'Pending',
      'service': 'Lab Test',
      'doctor': 'MedLab Inc.'
    },
    {
      'invoiceNo': '202505-95',
      'date': '13-05-2025',
      'amount': 210.00,
      'status': 'Overdue',
      'service': 'MRI Scan',
      'doctor': 'City Hospital'
    },
    {
      'invoiceNo': 'G-202505-93',
      'date': '10-05-2025',
      'amount': 150.00,
      'status': 'Pending',
      'service': 'Medication',
      'doctor': 'PharmaCare'
    },
  ];

  final List<Map<String, dynamic>> _allPaidPayments = [
    {
      'invoiceNo': '202505-85',
      'date': '01-05-2025',
      'paidDate': '02-05-2025',
      'amount': 200.00,
      'service': 'Annual Checkup',
      'doctor': 'Dr. Johnson'
    },
    {
      'invoiceNo': '202505-88',
      'date': '05-05-2025',
      'paidDate': '06-05-2025',
      'amount': 150.00,
      'service': 'Vaccination',
      'doctor': 'Health Center'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final currentPayments =
        _currentTabIndex == 0 ? _allDuePayments : _allPaidPayments;
    final totalAmount = currentPayments.fold(
        0.0, (sum, item) => sum + (item['amount'] as double));
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return Scaffold(
      appBar: AppBar(
        title: Text('My Payments',style: kTitleMedium.copyWith(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Column(
        children: [
          // Tab Selector
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildTabButton(
                    'Due Payments',
                    0,
                    _allDuePayments.length,
                    AppColors.kPrimaryColor,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _buildTabButton(
                    'Paid Payments',
                    1,
                    _allPaidPayments.length,
                    AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),

          // Summary Card
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              /*elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),*/
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.2),
                    spreadRadius: 5,
                    blurRadius: 20,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _currentTabIndex == 0 ? 'TOTAL DUE' : 'TOTAL PAID',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      currencyFormat.format(totalAmount),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: _currentTabIndex == 0
                            ? Colors.red.shade700
                            : Colors.green.shade700,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildSummaryItem(
                          'Invoices',
                          currentPayments.length.toString(),
                          Icons.receipt,
                          Colors.blue.shade800,
                        ),
                        _buildSummaryItem(
                          _currentTabIndex == 0 ? 'Pending' : 'Last Paid',
                          _currentTabIndex == 0
                              ? _allDuePayments
                                  .where((p) => p['status'] == 'Pending')
                                  .length
                                  .toString()
                              : _allPaidPayments.isNotEmpty
                                  ? _allPaidPayments.last['paidDate']
                                  : 'N/A',
                          _currentTabIndex == 0
                              ? Icons.pending_actions
                              : Icons.calendar_today,
                          _currentTabIndex == 0
                              ? Colors.orange.shade600
                              : Colors.green.shade600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Payment Cards List
          Expanded(
            child: currentPayments.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_off,
                          size: 60,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 16),
                        Text(
                          _currentTabIndex == 0
                              ? 'No due payments'
                              : 'No payment history',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: currentPayments.length,
                    itemBuilder: (context, index) {
                      final payment = currentPayments[index];
                      return _buildPaymentCard(payment, _currentTabIndex == 0);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index, int count, Color color) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentTabIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: _currentTabIndex == index
              ? color.withOpacity(0.2)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _currentTabIndex == index ? color : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _currentTabIndex == index ? color : Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: _currentTabIndex == index ? color : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _currentTabIndex == index
                      ? Colors.white
                      : Colors.grey.shade800,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
      String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard(Map<String, dynamic> payment, bool isDue) {
    final currencyFormat = NumberFormat.currency(symbol: '\$');
    final isOverdue = isDue && payment['status'] == 'Overdue';

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'INVOICE #${payment['invoiceNo']}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                if (isDue)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isOverdue
                          ? Colors.red.shade50
                          : Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      payment['status'],
                      style: TextStyle(
                        color: isOverdue
                            ? Colors.red.shade700
                            : Colors.orange.shade700,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12),
            _buildCardDetailRow('Service:', payment['service']),
            _buildCardDetailRow('Provider:', payment['doctor']),
            _buildCardDetailRow(isDue ? 'Invoice Date:' : 'Paid Date:',
                isDue ? payment['date'] : payment['paidDate']),
            Divider(height: 24,color: AppColors.kGrayColor200,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currencyFormat.format(payment['amount']),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDue ? Colors.red.shade700 : Colors.green.shade700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            if (isDue)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showPaymentOptions(payment),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Pay Now'),
                ),
              ),
            if (!isDue)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _showReceipt(payment),
                    child: Text(
                      'View Receipt',
                      style: TextStyle(color: Colors.blue.shade800),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Download',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentOptions(Map<String, dynamic> payment) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Pay Invoice #${payment['invoiceNo']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Amount: \$${payment['amount'].toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Select Payment Method:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 12),
                _buildPaymentMethodOption(
                    'Credit/Debit Card', Icons.credit_card),
                _buildPaymentMethodOption('PayPal', Icons.payment),
                _buildPaymentMethodOption(
                    'Bank Transfer', Icons.account_balance),
                _buildPaymentMethodOption('bKash', Icons.mobile_friendly),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _showPaymentSuccess(payment);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text('Confirm Payment'),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),

        ));
  }

  Widget _buildPaymentMethodOption(String method, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue.shade800),
        title: Text(method),
        trailing: Radio<String>(
          value: method,
          groupValue: method,
          onChanged: (value) {},
          activeColor: Colors.blue.shade800,
        ),
      ),
    );
  }

  void _showPaymentSuccess(Map<String, dynamic> payment) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                'Payment Successful!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Invoice #${payment['invoiceNo']}',
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '\$${payment['amount'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      // In a real app, this would be an API call
                      _allPaidPayments.add({
                        ...payment,
                        'paidDate':
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                      });
                      _allDuePayments.removeWhere(
                          (p) => p['invoiceNo'] == payment['invoiceNo']);
                    });
                  },
                  child: Text('Done'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showReceipt(Map<String, dynamic> payment) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'PAYMENT RECEIPT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
              SizedBox(height: 24),
              _buildReceiptDetail('Invoice Number', payment['invoiceNo']),
              _buildReceiptDetail('Service', payment['service']),
              _buildReceiptDetail('Provider', payment['doctor']),
              _buildReceiptDetail('Invoice Date', payment['date']),
              _buildReceiptDetail('Paid Date', payment['paidDate']),
              Divider(height: 32),
              _buildReceiptDetail(
                'Total Amount',
                '\$${payment['amount'].toStringAsFixed(2)}',
                isAmount: true,
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Share functionality
                      },
                      child: Text('Share'),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Colors.blue.shade800),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Print functionality
                      },
                      child: Text('Print'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReceiptDetail(String label, String value,
      {bool isAmount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isAmount ? FontWeight.bold : FontWeight.normal,
              fontSize: isAmount ? 16 : null,
              color: isAmount ? Colors.green.shade700 : null,
            ),
          ),
        ],
      ),
    );
  }
}
