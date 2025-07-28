import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_strings.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/staff_portal/attendence/cubit/attendance_cubit.dart';
import 'package:medPilot/features/staff_portal/attendence/model/attendance_model.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AttendanceCubit>().getAttendanceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.kPrimaryColor,
            title: Text(
              AppStrings.attendance.tr(),
              style: kTitleMedium.copyWith(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          body: Visibility(
            visible: state.appStatus != AppStatus.initialLoading,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  // App bar with gradient
                  _buildDateHeader(),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Shift progress indicator
                        _buildShiftProgress(10.0, theme),
                        const SizedBox(height: 24),

                        // Shift timeline
                        /*       _buildShiftTimeline(state.attendanceModel?.data??AttendanceData(), context),
                    const SizedBox(height: 24),*/

                        // Attendance status cards
                        _buildStatusCards(
                            state.attendanceModel?.data ?? AttendanceData(),
                            theme),

                        // Action grid
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildShiftProgress(double progress, ThemeData theme) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
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
            8.verticalSpace,
            LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              borderRadius: BorderRadius.circular(10),
              color: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Started at ${state.attendanceModel?.data?.breakStart?.scheduled}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.hintColor,
                  ),
                ),
                Text(
                  'Ends at ${state.attendanceModel?.data?.breakEnd?.scheduled}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.hintColor,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatusCards(AttendanceData data, ThemeData theme) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      // Width/height ratio
      children: [
        _buildStatusCard(
            onTap: () {
              context.read<AttendanceCubit>().checkIn(data.checkIn!.id!);
            },
            title: 'Check In',
            icon: Icons.login,
            time: data.checkIn?.scheduled ?? "",
            color: const Color(0xFF5E35B1),
            isButtonEnable: data.checkIn?.canCheckIn ?? false),
        _buildStatusCard(
            onTap: () {context.read<AttendanceCubit>().breakStart(data.breakStart!.id!);},
            title: 'Break Start',
            icon: Icons.coffee,
            time: data.breakStart?.scheduled ?? "",
            color: const Color(0xFFF57C00),
            isButtonEnable: data.breakStart?.canStartBreak ?? false),
        _buildStatusCard(
            onTap: () {context.read<AttendanceCubit>().breakEnd(data.breakEnd!.id!);},
            title: 'Break End',
            icon: Icons.done,
            time: data.breakEnd?.scheduled ?? "",
            color: const Color(0xFF43A047),
            isButtonEnable: data.breakEnd?.canEndBreak ?? false),
        _buildStatusCard(
            onTap: () {context.read<AttendanceCubit>().checkOut(data.checkOut!.id!);},
            title: 'Check Out',
            icon: Icons.logout,
            time: data.checkOut?.scheduled ?? "",
            color: const Color(0xFFE53935),
            isButtonEnable: data.checkOut?.canCheckOut ?? false),
      ],
    );
  }

  Widget _buildStatusCard({
    required String title,
    required IconData icon,
    required String? time,
    required Color color,
    required bool isButtonEnable,
    required VoidCallback onTap,
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
          Visibility(
            visible: isButtonEnable,
            child: Container(
              margin: EdgeInsetsGeometry.only(top: 10.h),
              padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.kGrayColor200,
                    // Change to your desired color
                    width: 2.0, // Thickness of the top border
                  ),
                ),
              ),
              child: Center(
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          title,
                          style: kTitleSmall.copyWith(
                              color: AppColors.kPrimarySpeechBlue500),
                        )),
                        Icon(
                          Icons.arrow_forward,
                          size: 24.r,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDateHeader() {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
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
                '${state.attendanceModel?.date}, ${state.attendanceModel?.day}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
