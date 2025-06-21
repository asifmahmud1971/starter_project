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

extension StringDateTimeChecker on String {
  bool get isToday {
    try {
      final date = DateTime.tryParse(this);
      if (date == null) return false;

      final now = DateTime.now();
      return date.year == now.year &&
          date.month == now.month &&
          date.day == now.day;
    } catch (e) {
      return false;
    }
  }
}