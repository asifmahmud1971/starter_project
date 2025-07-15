import 'package:flutter/material.dart';

class AlarmSetting {
  String type;
  TimeOfDay time;
  bool isActive;
  List<String>? days;
  DateTime? startDate;
  DateTime? endDate;

  AlarmSetting({
    required this.type,
    required this.time,
    this.isActive = true,
    this.days,
    this.startDate,
    this.endDate,
  });
}