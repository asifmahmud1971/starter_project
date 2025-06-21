import 'package:flutter/material.dart';
import 'package:medPilot/features/staff_portal/roaster/view/roaster_screen_view.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/day_schedule_card.dart';

class DayScheduleList extends StatelessWidget {
  const DayScheduleList({super.key});

  // Parse API response data
  List<Roster> _parseRosters() {
    return [
      Roster(
        date: "2025-06-21",
        label: "Saturday, June 21",
        isToday: true,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "10:00",
            endTime: "19:00",
            shiftName: "Day",
            staffName: "ffff",
            workTime: "09.00",
            location: "location",
          ),
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-22",
        label: "Sunday, June 22",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-23",
        label: "Monday, June 23",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "10:00",
            endTime: "19:00",
            shiftName: "Day",
            staffName: "ffff",
            workTime: "09.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-24",
        label: "Tuesday, June 24",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-25",
        label: "Wednesday, June 25",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-26",
        label: "Thursday, June 26",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
      Roster(
        date: "2025-06-27",
        label: "Friday, June 27",
        isToday: false,
        entries: [
          RosterEntry(
            type: "shift",
            startTime: "08:00",
            endTime: "14:00",
            shiftName: "Morning",
            staffName: "ffff",
            workTime: "06.00",
            location: "location",
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final rosters = _parseRosters();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: rosters.length,
      itemBuilder: (context, index) {
        return DayScheduleCard(roster: rosters[index]);
      },
    );
  }
}