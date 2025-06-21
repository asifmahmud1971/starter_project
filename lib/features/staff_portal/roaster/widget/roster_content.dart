import 'package:flutter/material.dart';
import 'package:medPilot/features/staff_portal/roaster/view/day_schedule_list.dart';

class RosterContent extends StatelessWidget {
  const RosterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Your Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A2B3C),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const DayScheduleList(),
        ],
      ),
    );
  }
}