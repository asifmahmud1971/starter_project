import 'package:flutter/material.dart';
import 'package:medPilot/core/utils/extension.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
import 'package:medPilot/features/staff_portal/roaster/view/roaster_screen_view.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/shift_card.dart';

class DayScheduleCard extends StatelessWidget {
  final Rosters roster;

  const DayScheduleCard({super.key, required this.roster});

  @override
  Widget build(BuildContext context) {
    // Special handling for holiday (June 27)
    final isHoliday = roster.date == "2025-06-27";

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Date Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: BoxDecoration(
              color: roster.date?.isToday??false
                  ? const Color(0xFFF67F26)
                  : const Color(0xFFF4F4F4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Center(
              child: Text(
                /*roster.date!.isToday ? "TODAY | ${roster.toUpperCase()}":roster.label,*/
                roster.date?.isToday??false ? "TODAY | ${roster.label}":roster.label??"",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: roster.date?.isToday??false ? Colors.white : const Color(0xFF1A2B3C),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),

          // Holiday Banner
          if (isHoliday)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFA500), Color(0xFFF67F26)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Text(
                  'HOLIDAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),

          // Shifts List
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFD),
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(18),
                bottomRight: const Radius.circular(18),
              ),
            ),
            child: Column(
              children: (roster.entries??[]).map((entry) => ShiftCard(entry: entry)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}