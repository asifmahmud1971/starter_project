import 'package:flutter/material.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Mock data from JSON
  final Map<String, dynamic> attendanceData = {
    'date': '01-07-2025',
    'day': 'Tuesday',
    'shift': {
      'start': '10:00',
      'end': '19:00',
      'break_start': '13:00',
      'break_end': '13:30',
    },
    'attendance': {
      'check_in': null,
      'check_out': null,
      'break_start': null,
      'break_end': null,
    },
    'status': 'working_day',
    'actions': {
      'can_check_in': false,
      'can_check_out': false,
      'can_start_break': false,
      'can_end_break': false,
    }
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final now = TimeOfDay.now();
    final shiftStart = _parseTime(attendanceData['shift']['start']);
    final shiftEnd = _parseTime(attendanceData['shift']['end']);

    // Calculate shift progress
    final totalMinutes = _timeDifference(shiftStart, shiftEnd);
    final elapsedMinutes = _timeDifference(shiftStart, now);
    final progress = elapsedMinutes / totalMinutes;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App bar with gradient
           _buildDateHeader(attendanceData),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Shift progress indicator
                  _buildShiftProgress(progress, theme),
                  const SizedBox(height: 24),

                  // Shift timeline
                  _buildShiftTimeline(attendanceData, context),
                  const SizedBox(height: 24),

                  // Attendance status cards
                  _buildStatusCards(attendanceData, theme),
                  const SizedBox(height: 32),

                  // Action grid
                  _buildActionGrid(attendanceData, colors),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildShiftProgress(double progress, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SHIFT PROGRESS',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.hintColor,
                letterSpacing: 1.1,
              ),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          minHeight: 12,
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.primary,
          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Started at ${attendanceData['shift']['start']}',
              style: TextStyle(
                fontSize: 12,
                color: theme.hintColor,
              ),
            ),
            Text(
              'Ends at ${attendanceData['shift']['end']}',
              style: TextStyle(
                fontSize: 12,
                color: theme.hintColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShiftTimeline(Map<String, dynamic> data, BuildContext context) {
    final shift = data['shift'] as Map<String, dynamic>;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTimelineItem(
            icon: Icons.alarm_on,
            title: 'Shift Start',
            time: shift['start'],
            isActive: true,
          ),
          _buildTimelineDivider(),
          _buildTimelineItem(
            icon: Icons.coffee,
            title: 'Break Start',
            time: shift['break_start'],
            isActive: false,
          ),
          _buildTimelineDivider(),
          _buildTimelineItem(
            icon: Icons.lunch_dining,
            title: 'Break End',
            time: shift['break_end'],
            isActive: false,
          ),
          _buildTimelineDivider(),
          _buildTimelineItem(
            icon: Icons.alarm_off,
            title: 'Shift End',
            time: shift['end'],
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required IconData icon,
    required String title,
    required String time,
    required bool isActive,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey,
            ),
          ),
        ),
        Text(
          time,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Container(width: 1, height: 20, color: Colors.grey.withOpacity(0.3)),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildStatusCards(Map<String, dynamic> data, ThemeData theme) {
    final attendance = data['attendance'] as Map<String, dynamic>;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildStatusCard(
          title: 'Check In',
          icon: Icons.login,
          time: attendance['check_in'],
          color: const Color(0xFF5E35B1),
        ),
        _buildStatusCard(
          title: 'Break Start',
          icon: Icons.coffee,
          time: attendance['break_start'],
          color: const Color(0xFFF57C00),
        ),
        _buildStatusCard(
          title: 'Break End',
          icon: Icons.done,
          time: attendance['break_end'],
          color: const Color(0xFF43A047),
        ),
        _buildStatusCard(
          title: 'Check Out',
          icon: Icons.logout,
          time: attendance['check_out'],
          color: const Color(0xFFE53935),
        ),
      ],
    );
  }

  Widget _buildStatusCard({
    required String title,
    required IconData icon,
    required String? time,
    required Color color,
  }) {
    final isCompleted = time != null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(isCompleted ? 0.2 : 0.1),
            ),
            child: Icon(
              icon,
              color: isCompleted ? color : color.withOpacity(0.5),
              size: 24,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time ?? '--:--',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isCompleted
                  ? color
                  : Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDateHeader(Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s Attendance',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${data['date']}, ${data['day']}',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionGrid(Map<String, dynamic> data, ColorScheme colors) {
    final actions = data['actions'] as Map<String, dynamic>;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACTIONS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).hintColor,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: [
            _buildActionButton(
              'Check In',
              Icons.login,
              actions['can_check_in'],
              colors.primary,
            ),
            _buildActionButton(
              'Check Out',
              Icons.logout,
              actions['can_check_out'],
              colors.secondary,
            ),
            _buildActionButton(
              'Start Break',
              Icons.coffee,
              actions['can_start_break'],
              const Color(0xFFF57C00),
            ),
            _buildActionButton(
              'End Break',
              Icons.done_all,
              actions['can_end_break'],
              const Color(0xFF43A047),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(
      String label,
      IconData icon,
      bool enabled,
      Color color,
      ) {
    return ElevatedButton.icon(
      onPressed: enabled ? () {} : null,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: enabled
            ? color
            : color.withOpacity(0.1),
        foregroundColor: enabled
            ? Colors.white
            : color.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        elevation: enabled ? 2 : 0,
      ),
    );
  }

  // Helper functions for time calculations
  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  int _timeDifference(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return endMinutes - startMinutes;
  }
}