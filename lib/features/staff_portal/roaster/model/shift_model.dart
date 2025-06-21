class Shift {
  final DateTime date;
  final String shiftType;
  final String timeRange;
  final String location;
  final double hours;

  Shift({
    required this.date,
    required this.shiftType,
    required this.timeRange,
    required this.location,
    required this.hours,
  });
}
final List<Shift> shifts = [
  Shift(
    date: DateTime(2025, 6, 21),
    shiftType: "Day Shift",
    timeRange: "10:00 AM - 7:00 PM",
    location: "location",
    hours: 9.0,
  ),
  Shift(
    date: DateTime(2025, 6, 21),
    shiftType: "Morning Shift",
    timeRange: "8:00 AM - 2:00 PM",
    location: "location",
    hours: 6.0,
  ),
  Shift(
    date: DateTime(2025, 6, 22),
    shiftType: "Morning Shift",
    timeRange: "8:00 AM - 2:00 PM",
    location: "location",
    hours: 6.0,
  ),
  Shift(
    date: DateTime(2025, 6, 23),
    shiftType: "Day Shift",
    timeRange: "10:00 AM - 7:00 PM",
    location: "location",
    hours: 9.0,
  ),
  Shift(
    date: DateTime(2025, 6, 24),
    shiftType: "Morning Shift",
    timeRange: "8:00 AM - 2:00 PM",
    location: "location",
    hours: 6.0,
  ),
  Shift(
    date: DateTime(2025, 6, 25),
    shiftType: "Morning Shift",
    timeRange: "8:00 AM - 2:00 PM",
    location: "location",
    hours: 6.0,
  ),
  Shift(
    date: DateTime(2025, 6, 26),
    shiftType: "Morning Shift",
    timeRange: "8:00 AM - 2:00 PM",
    location: "location",
    hours: 6.0,
  ),
];