import 'package:flutter/material.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/components/custom_button.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/features/patient_portal/on_demand_service/view/add_ambulance_page.dart';

class AmbulanceScreen extends StatefulWidget {
  const AmbulanceScreen({super.key});

  @override
  State<AmbulanceScreen> createState() => _AmbulanceScreenState();
}

class _AmbulanceScreenState extends State<AmbulanceScreen> {
  final List<Map<String, String>> requests = [
    {
      "invoice": "G-202506-97",
      "datetime": "03-06-2025 08:00 PM",
    },
    {
      "invoice": "G-202505-94",
      "datetime": "11-05-2025 10:28 AM",
    },
    {
      "invoice": "G-202505-93",
      "datetime": "23-05-2025 05:31 PM",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: AppColors.kDecoration,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Invoice No: ${request['invoice']}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Date/Time: ${request['datetime']}"),
                  Divider(thickness: 1,color: AppColors.kGrayColor200,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: CustomButton(
                          onTap: (){},
                          title: "Invoice",
                          backgroundColor: AppColors.kSuccess500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CustomButton(
                          onTap: (){},
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
