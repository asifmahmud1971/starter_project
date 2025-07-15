import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/features/patient_portal/services/pescription/model/alarm_setting.dart';

class AlarmSettingsBottomSheet extends StatefulWidget {
  final String medicineName;
  final String duration;

  const AlarmSettingsBottomSheet({
    super.key,
    required this.medicineName,
    required this.duration,
  });

  @override
  State<AlarmSettingsBottomSheet> createState() =>
      _AlarmSettingsBottomSheetState();
}

class _AlarmSettingsBottomSheetState extends State<AlarmSettingsBottomSheet> {
  String _alarmType = 'Daily';
  TimeOfDay _selectedTime = TimeOfDay.now();
  final List<bool> _selectedDays = List.filled(7, false);
  bool _notifyPortal = true;
  bool _notifyNurse = true;
  DateTime? _startDate;
  DateTime? _endDate;
  final List<AlarmSetting> _alarms = [];

  @override
  void initState() {
    super.initState();
    _startDate = DateTime.now();
    _endDate = DateTime.now().add(const Duration(days: 5));
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = screenHeight * 0.85;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      padding: EdgeInsets.all(24.r),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Set Alarm for ${widget.medicineName}',
                    style: kTitleLarge.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 24.r),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            16.verticalSpace,

            // Alarm Type Selection
            Text(
              'Alarm Type',
              style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: DropdownButton<String>(
                value: _alarmType,
                isExpanded: true,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                  DropdownMenuItem(value: 'Custom', child: Text('Custom')),
                ],
                onChanged: (value) {
                  setState(() {
                    _alarmType = value!;
                  });
                },
              ),
            ),
            16.verticalSpace,

            // Time Picker
            Text(
              'Alarm Time',
              style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            InkWell(
              onTap: _selectTime,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedTime.format(context),
                      style: kBodyLarge.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.access_time, color: Colors.grey),
                  ],
                ),
              ),
            ),
            16.verticalSpace,

            // Custom Days Selector (only shown when Custom is selected)
            if (_alarmType == 'Custom') ...[
              Text(
                'Select Days',
                style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (index) {
                  final dayNames = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDays[index] = !_selectedDays[index];
                      });
                    },
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: _selectedDays[index]
                            ? AppColors.kPrimaryColor
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _selectedDays[index]
                              ? AppColors.kPrimaryColor
                              : Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          dayNames[index],
                          style: TextStyle(
                            color: _selectedDays[index]
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              16.verticalSpace,
            ],

            // Duration Selector
            Text(
              'Duration',
              style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(isStart: true),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _startDate != null
                                ? DateFormat('dd-MM-yyyy').format(_startDate!)
                                : 'Start Date',
                            style: kBodyMedium,
                          ),
                          Icon(Icons.calendar_today, size: 20.r, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
                8.horizontalSpace,
                Text('to', style: kBodyMedium),
                8.horizontalSpace,
                Expanded(
                  child: InkWell(
                    onTap: () => _selectDate(isStart: false),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _endDate != null
                                ? DateFormat('dd-MM-yyyy').format(_endDate!)
                                : 'End Date',
                            style: kBodyMedium,
                          ),
                          Icon(Icons.calendar_today, size: 20.r, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,

            // Notification Settings
            Text(
              'Notifications',
              style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNotificationToggle(
                  label: 'Portal',
                  value: _notifyPortal,
                  onChanged: (v) => setState(() => _notifyPortal = v!),
                ),
                _buildNotificationToggle(
                  label: 'Nurse',
                  value: _notifyNurse,
                  onChanged: (v) => setState(() => _notifyNurse = v!),
                ),
              ],
            ),
            24.verticalSpace,

            // Add Alarm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addAlarm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16.r),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Add Alarm',
                  style: kBodyLarge.copyWith(color: Colors.white),
                ),
              ),
            ),
            16.verticalSpace,

            // List of Added Alarms
            if (_alarms.isNotEmpty) ...[
              Text(
                'Active Alarms',
                style: kTitleMedium.copyWith(fontWeight: FontWeight.bold),
              ),
              8.verticalSpace,
              ..._alarms.map((alarm) => _buildAlarmItem(alarm)).toList(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle({
    required String label,
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.kPrimaryColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          4.horizontalSpace,
          Text(label, style: kBodyMedium),
        ],
      ),
    );
  }

  Widget _buildAlarmItem(AlarmSetting alarm) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Icon(
          alarm.type == 'Daily' ? Icons.repeat : Icons.calendar_today,
          color: AppColors.kPrimaryColor,
        ),
        title: Text(
          alarm.time.format(context),
          style: kBodyMedium.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          alarm.type == 'Custom'
              ? 'Days: ${alarm.days?.join(', ') ?? ''}'
              : 'Every day',
          style: kBodySmall,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Switch(
              value: alarm.isActive,
              onChanged: (value) => _toggleAlarm(alarm, value),
              activeColor: AppColors.kPrimaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            IconButton(
              icon: Icon(Icons.delete, size: 20.r, color: Colors.red),
              onPressed: () => _removeAlarm(alarm),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && mounted) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate({required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate ?? DateTime.now() : _endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && mounted) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          // Ensure end date is after start date
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = picked.add(const Duration(days: 1));
          }
        } else {
          _endDate = picked;
          // Ensure start date is before end date
          if (_startDate != null && _startDate!.isAfter(picked)) {
            _startDate = picked.subtract(const Duration(days: 1));
          }
        }
      });
    }
  }

  void _addAlarm() {
    List<String>? days;
    if (_alarmType == 'Custom') {
      final dayNames = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
      days = [];
      for (int i = 0; i < _selectedDays.length; i++) {
        if (_selectedDays[i]) {
          days.add(dayNames[i]);
        }
      }

      if (days.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one day for custom alarm')),
        );
        return;
      }
    }

    setState(() {
      _alarms.add(AlarmSetting(
        type: _alarmType,
        time: _selectedTime,
        days: days,
        startDate: _startDate,
        endDate: _endDate,
      ));
    });

    // Reset form for next entry
    _selectedTime = TimeOfDay.now();
    if (_alarmType == 'Custom') {
      for (int i = 0; i < _selectedDays.length; i++) {
        _selectedDays[i] = false;
      }
    }
  }

  void _toggleAlarm(AlarmSetting alarm, bool value) {
    if (mounted) {
      setState(() {
        alarm.isActive = value;
      });
    }
  }

  void _removeAlarm(AlarmSetting alarm) {
    if (mounted) {
      setState(() {
        _alarms.remove(alarm);
      });
    }
  }
}