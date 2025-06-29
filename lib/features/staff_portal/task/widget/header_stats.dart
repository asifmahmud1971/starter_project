import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class HeaderStats extends StatelessWidget {
  final int pending;
  final int inProgress;
  final int completed;

  const HeaderStats({super.key, required this.pending, required this.inProgress, required this.completed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Tasks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatItem(label: 'Pending', value: pending.toString(), icon: Icons.access_time),
              StatItem(label: 'In Progress', value: inProgress.toString(), icon: Icons.autorenew),
              StatItem(label: 'Completed', value: completed.toString(), icon: Icons.check_circle),
            ],
          ),
        ],
      ),
    );
  }
}
class StatItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const StatItem({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.white),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white70)),
      ],
    );
  }
}