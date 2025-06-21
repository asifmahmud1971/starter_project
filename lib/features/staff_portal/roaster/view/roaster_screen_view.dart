import 'package:flutter/material.dart';
import 'package:medPilot/features/staff_portal/roaster/model/shift_model.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/roster_content.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/shift_card.dart';

class RosterScreen extends StatelessWidget {
  const RosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month,
              size: 20,
              color: Color(0xFFF67F26),
            ),
            const SizedBox(width: 8),
            Text(
              'ROSTER',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                letterSpacing: 1.2,
                color: const Color(0xFF1A2B3C),
              ),
            ),
          ],
        ),
      ),
      body: const RosterContent(),
    );
  }
}

// API Response Models
class Roster {
  final String date;
  final String label;
  final bool isToday;
  final List<RosterEntry> entries;

  Roster({
    required this.date,
    required this.label,
    required this.isToday,
    required this.entries,
  });
}

class RosterEntry {
  final String type;
  final String startTime;
  final String endTime;
  final String shiftName;
  final String staffName;
  final String workTime;
  final String location;

  RosterEntry({
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.shiftName,
    required this.staffName,
    required this.workTime,
    required this.location,
  });
}