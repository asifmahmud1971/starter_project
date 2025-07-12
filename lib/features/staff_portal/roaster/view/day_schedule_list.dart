import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/features/staff_portal/roaster/cubit/roster_cubit.dart';
import 'package:medPilot/features/staff_portal/roaster/model/roster_model.dart';
import 'package:medPilot/features/staff_portal/roaster/view/roaster_screen_view.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/day_schedule_card.dart';

class DayScheduleList extends StatelessWidget {
  const DayScheduleList({super.key});

  // Parse API response data


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RosterCubit, RosterState>(
      builder: (context, state) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          itemCount: (state.rosterModel?.rosters??[]).length,
          itemBuilder: (context, index) {
            return DayScheduleCard(roster: state.rosterModel?.rosters?[index]??Rosters());
          },
        );
      },
    );
  }
}