import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Color _getBPColor(TextEditingController bpHighController,TextEditingController bpLowController,) {
  final high = int.tryParse(bpHighController.text) ?? 0;
  final low = int.tryParse(bpLowController.text) ?? 0;

  if (high > 140 || low > 90) return Colors.orange;
  if (high > 160 || low > 100) return Colors.red;
  if (high < 90 || low < 60) return Colors.blue;
  return Colors.green;
}

Color _getPulseColor(TextEditingController pulseController) {
  final pulse = int.tryParse(pulseController.text) ?? 0;
  if (pulse > 100) return Colors.orange;
  if (pulse > 120) return Colors.red;
  if (pulse < 60) return Colors.blue;
  return Colors.green;
}

Color _getSaturationColor(TextEditingController saturationController) {
  final sat = int.tryParse(saturationController.text) ?? 0;
  if (sat < 95) return Colors.orange;
  if (sat < 90) return Colors.red;
  return Colors.green;
}

Color _getTempColor(TextEditingController tempController) {
  final temp = double.tryParse(tempController.text) ?? 0;
  if (temp > 99.5) return Colors.orange;
  if (temp > 100.4) return Colors.red;
  if (temp < 97.0) return Colors.blue;
  return Colors.green;
}

Color _getBloodSugarColor(TextEditingController bloodSugarController) {
  final sugar = double.tryParse(bloodSugarController.text) ?? 0;
  if (sugar > 7.8) return Colors.orange;
  if (sugar > 11.1) return Colors.red;
  if (sugar < 4.0) return Colors.blue;
  return Colors.green;
}