import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';

class FollowUpCard extends StatelessWidget {
  final String? dateTime;
  final String? place;
  final String? vType;
  final bool? critical;
  final VoidCallback? onTap;

  const FollowUpCard({
    super.key,
     this.dateTime,
     this.place,
     this.vType,
     this.critical,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final parsedDate = DateTime.parse(dateTime??"");
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: critical??false ? Colors.red[50] : Colors.white,
          boxShadow: [AppColors.kBackGroundShadow],
          borderRadius: BorderRadius.circular(8.r)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place??"",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        vType??"",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  if (critical??false)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning, size: 14, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            'Critical',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    dateFormat.format(parsedDate),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    timeFormat.format(parsedDate),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}