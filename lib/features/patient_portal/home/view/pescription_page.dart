import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medPilot/core/components/custom_svg.dart';
import 'package:medPilot/core/constants/app_colors.dart';
import 'package:medPilot/core/constants/app_text_style.dart';
import 'package:medPilot/generated/assets.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('PRESCRIPTION'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                '12/05/2025',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Patient Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Patient 1',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.cake, color: Colors.black, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        '25 Yrs • Male',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.black, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        '01717926565',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.medical_services, color: Colors.black, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'Dr. ABC',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, color: Colors.black, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        'Last Updated: 05/05/2025 11:49 AM',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Diagnosis Section
            const Text(
              'Diagnosis',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'No diagnosis notes',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),

            // Medications Section
            const Text(
              'Medications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Medication Card 1
            MedicationCard(
              icon: Icons.medication,
              iconColor: Colors.blue,
              title: 'Tab. Entacyd Plus',
              subtitle: 'Aluminium Hydroxide + Magnesium Hydroxide + Simethicone',
              dose: '1+1+1',
              note: 'tey',
            ),
            const SizedBox(height: 16),

            // Medication Card 2
            MedicationCard(
              icon: Icons.medical_services,
              iconColor: Colors.green,
              title: 'Syp. Entacyd Plus 200ml',
              subtitle: 'Aluminium Hydroxide + Magnesium Hydroxide + Simethicone',
              dose: '0+0+1',
              duration: '05-05-2025 To 12-05-2025',
            ),
            const SizedBox(height: 32),

            // Advice Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Advice',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'No additional advice',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Hospital Info
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.call, size: 18, color: AppColors.kPrimaryColor),
                      const SizedBox(width: 6),
                      Text(
                        '01717926561',
                        style: kBodyMedium.copyWith(color: AppColors.kBlackColor),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.email_outlined, size: 18, color: AppColors.kPrimaryColor),
                      const SizedBox(width: 6),
                      Text(
                        'admin@hphospital.com',
                        style: kBodyMedium.copyWith(color: AppColors.kBlackColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on_outlined, size: 18, color: AppColors.kPrimaryColor),
                      const SizedBox(width: 6),
                      Text(
                        'Dhaka, Bangladesh',
                        style: kBodyMedium.copyWith(color: AppColors.kBlackColor),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.language, size: 18, color: AppColors.kPrimaryColor),
                      const SizedBox(width: 6),
                      Text(
                        'www.medpilot.app',
                        style: kBodyMedium.copyWith(color: AppColors.kBlackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            20.verticalSpace
          ],
        ),
      ),
    );
  }
}

class MedicationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String dose;
  final String? note;
  final String? duration;

  const MedicationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.dose,
    this.note,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [AppColors.backgroundShadow]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomSvg(icon: Assets.medMedicine,size: 24.r,),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.schedule, size: 16),
                const SizedBox(width: 8),
                Text('Dose: $dose'),
              ],
            ),
            if (note != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.note, size: 16),
                  const SizedBox(width: 8),
                  Text('Note: $note'),
                ],
              ),
            ],
            if (duration != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 8),
                  Text('Duration: $duration'),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}