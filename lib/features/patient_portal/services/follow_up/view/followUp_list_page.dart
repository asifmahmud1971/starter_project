import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/services/cubit/services_cubit.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/view/add_followUp.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/view/followUp_description_page.dart';
import 'package:medPilot/features/patient_portal/services/follow_up/widget/followUp_card.dart';

class FollowupListPage extends StatefulWidget {
  const FollowupListPage({super.key});

  @override
  State<FollowupListPage> createState() => _FollowupListPageState();
}

class _FollowupListPageState extends State<FollowupListPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ServiceCubit>().getFollowUpReport();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Patient Follow-Ups",
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.download, size: 26),
            onPressed: () => _showDownloadOptions(context),
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GetContext.to(AddFollowUpScreen());
        },
        icon: const Icon(Icons.add),
        label: const Text('New Entry'),
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 4,
      ),
      body: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {
          return Column(
            children: [
              _buildHeaderSection(),
              Expanded(
                child: ListView.separated(
                  itemCount: (state.followUp?.followup??[]).length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    return FollowUpCard(
                      dateTime: state.followUp?.followup?[index].date,
                      place: state.followUp?.followup?[index].place,
                      vType: state.followUp?.followup?[index].type,
                      critical: false,
                      onTap: () {
                        GetContext.to(FollowUpDetails(followup: state.followUp?.followup?[index],));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return 10.verticalSpace;
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showDownloadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Export Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                title: const Text('PDF Format'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PDF report generated')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.table_chart, color: Colors.blue),
                title: const Text('Excel Format'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Excel report generated')),
                  );
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildStatCard('Total', '24', Icons.calendar_today),
              const SizedBox(width: 12),
              _buildStatCard('Critical', '3', Icons.warning,
                  color: Colors.orange),
              const SizedBox(width: 12),
              _buildStatCard('Today', '1', Icons.today, color: Colors.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon,
      {Color color = Colors.grey}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
