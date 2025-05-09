extension StringNumberExtraction on String {
  bool? timeEntryStatusCheck() {
    if (this == "pending" || this == "approved") {
      return false;
    } else {
      return true;
    }
  }
}

extension StringFormatter on String {
  /// Replaces placeholders with values provided in [params].
  /// Placeholders should be in the format `{key}`.
  String requestParams(Map<String, dynamic> params) {
    var formattedString = "$this \n$params";

    return formattedString;
  }
}
