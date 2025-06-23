import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class Staff {
  final String name;
  final String gender;
  final String age; // e.g. "0 Yrs 5 M 23 D"
  final String role;

  Staff({
    required this.name,
    required this.gender,
    required this.age,
    required this.role,
  });
}

class AssignShiftPage extends StatelessWidget {
  final List<Staff> staffList = [
    Staff(name: "John Doe", gender: "Male", age: "0 Yrs 5 M 23 D", role: "Staff"),
    Staff(name: "Anna Smith", gender: "Female", age: "2 Yrs 3 M 12 D", role: "Nurse"),
    Staff(name: "Mike Johnson", gender: "Male", age: "1 Yrs 0 M 5 D", role: "Staff"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Shift")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: staffList.length,
        itemBuilder: (context, index) {
          final staff = staffList[index];
          return SmartAssignShiftCard(staff: staffList[index]);
        },
      ),
    );
  }
}

class SmartAssignShiftCard extends StatelessWidget {
  final Staff staff;

  const SmartAssignShiftCard({super.key, required this.staff});

  @override
  Widget build(BuildContext context) {
    final isMale = staff.gender.toLowerCase() == "male";

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
                staff.name.isNotEmpty ? staff.name[0].toUpperCase() : '?',
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
                    staff.name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(isMale ? Icons.male : Icons.female, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        staff.gender,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "Age ${staff.age}",
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
                      staff.role,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

          /*  // Assign Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kSuccess400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Action
              },
              child: const Text("Assign", style: TextStyle(color: Colors.white)),
            )*/
          ],
        ),
      )
    );
  }
}
