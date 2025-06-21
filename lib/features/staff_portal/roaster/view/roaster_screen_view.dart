import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/features/staff_portal/roaster/cubit/roster_cubit.dart';
import 'package:medPilot/features/staff_portal/roaster/model/shift_model.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/roster_content.dart';
import 'package:medPilot/features/staff_portal/roaster/widget/shift_card.dart';

class RosterScreen extends StatefulWidget {
  const RosterScreen({super.key});

  @override
  State<RosterScreen> createState() => _RosterScreenState();
}

class _RosterScreenState extends State<RosterScreen> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<RosterCubit>().getRosterData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.calendar_month,
              size: 20,
              color: Color(0xFFF67F26),
            ),
            const SizedBox(width: 8),
            Text(
              'ROSTER',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                letterSpacing: 1.2,
                color: const Color(0xFF1A2B3C),
              ),
            ),
          ],
        ),
      ),
      body: const RosterContent(),
    );
  }
}
