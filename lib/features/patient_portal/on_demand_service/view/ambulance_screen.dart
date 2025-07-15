import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/cubit/onDemand_service_cubit.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/model/ambulance_model.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/add_ambulance_page.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final OnDemandServiceCubit onDemandCubit =
  GetContext.context.read<OnDemandServiceCubit>();

  @override
  void initState() {
    onDemandCubit.getAmbulance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance'),
        centerTitle: true,
      ),
      body: BlocBuilder<OnDemandServiceCubit, OnDemandServiceState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.ambulanceResponse?.ambulanceRequest?.length,
            itemBuilder: (context, index) {
              AmbulanceRequest?  ambulance = state.ambulanceResponse?.ambulanceRequest?.elementAt(index);
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: AppColors.kDecoration,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Invoice No: ${ambulance?.invoiceNo??""}",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Date/Time: ${ambulance?.invoiceDate??""} ${ambulance?.whenTime??""}"),
                      Divider(thickness: 1, color: AppColors.kGrayColor200,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: CustomButton(
                              onTap: () {},
                              title: "Invoice",
                              backgroundColor: AppColors.kSuccess500,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: CustomButton(
                              onTap: () {},
                              title: "Tracking",
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GetContext.to(AddAmbulancePage());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 4,
      ),
    );
  }
}
