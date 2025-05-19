extension MedicineParser on String {
  String get medicineName {
    final parts = split('<br>');
    return parts[0].trim();
  }

  String get medicineIngredients {
    final match = RegExp(r'\((.*?)\)').firstMatch(this);
    return match != null ? match.group(1)!.trim() : '';
  }
}