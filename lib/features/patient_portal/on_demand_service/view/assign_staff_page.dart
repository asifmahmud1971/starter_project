import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_date_time_formatter.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/assign_shift_model.dart';



class AssignShiftPage extends StatefulWidget {
 
  @override
  State<AssignShiftPage> createState() => _AssignShiftPageState();
}

class _AssignShiftPageState extends State<AssignShiftPage> {
  @override
  void initState() {
    GetContext.context.read<OnDemandServiceCubit>().getAssignStaff();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Shift")),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
  builder: (context, state) {
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: (state.assignStaffModel?.rosterInformation??[]).length,
        itemBuilder: (context, index) {
          RosterInformation? staff = state.assignStaffModel?.rosterInformation?.elementAt(index);
          return SmartAssignShiftCard(rosterStaff: staff);
        },
      );
  },
),
    );
  }
}

class SmartAssignShiftCard extends StatelessWidget {
  final RosterInformation? rosterStaff;

  const SmartAssignShiftCard({super.key, this.rosterStaff});

  @override
  Widget build(BuildContext context) {
    final isMale = rosterStaff?.date?.toLowerCase() == "male";

    return Container(
      decoration: AppColors.kDecoration,
      /*shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,*/
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.orange.shade100,
              child: Text(
                rosterStaff?.staff?.name!=null ? (rosterStaff?.staff?.name??'').toUpperCase() : '?',
                style: const TextStyle(fontSize: 28, color: Colors.orange),
              ),
            ),
            const SizedBox(width: 16),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rosterStaff?.staff?.name??"",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(isMale ? Icons.male : Icons.female, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        rosterStaff?.staff?.gander??"",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "Age ${rosterStaff?.staff?.dob??""}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      rosterStaff?.staff?.role??"",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  String? calculateAge(String dob) {
    DateTime today = DateTime.now();
    DateTime birthDate= DateTime.parse(dob);

    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return "$age";
  }
}
