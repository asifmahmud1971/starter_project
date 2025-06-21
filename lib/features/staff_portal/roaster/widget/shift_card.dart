import 'package:flutter/material.dart';
import 'package:medPilot/features/staff_portal/roaster/view/roaster_screen_view.dart';

class ShiftCard extends StatelessWidget {
  final RosterEntry entry;

  const ShiftCard({super.key, required this.entry});

  // Convert 24h time to 12h format
  String _formatTime(String time) {
    try {
      final parts = time.split(':');
      final hour = int.parse(parts[0]);
      final minute = parts.length > 1 ? int.parse(parts[1]) : 0;

      final period = hour >= 12 ? 'PM' : 'AM';
      final displayHour = hour % 12 == 0 ? 12 : hour % 12;

      return '$displayHour:${minute.toString().padLeft(2, '0')} $period';
    } catch (e) {
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          // Time indicator bar
          Container(
            width: 4,
            height: 60,
            decoration: BoxDecoration(
              color: entry.shiftName == "Day"
                  ? const Color(0xFFF67F26)
                  : const Color(0xFF4A90E2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 16),

          // Shift details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_formatTime(entry.startTime)} - ${_formatTime(entry.endTime)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A2B3C),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '${entry.shiftName} Shift'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: entry.shiftName == "Day"
                        ? const Color(0xFFF67F26)
                        : const Color(0xFF4A90E2),
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.staffName,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7F8FA4),
                  ),
                ),
              ],
            ),
          ),

          // Duration and location
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.workTime} Hours',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A2B3C),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: Color(0xFF7F8FA4),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    entry.location,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF7F8FA4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
