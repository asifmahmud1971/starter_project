class InvestigationsResponse {
  bool? success;
  List<Investigations>? investigations;

  InvestigationsResponse(
      {this.success, this.investigations});

  InvestigationsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['investigations'] != null) {
      investigations = <Investigations>[];
      json['investigations'].forEach((v) {
        investigations!.add(new Investigations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (investigations != null) {
      data['investigations'] =
          investigations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Investigations {
  String? date;
  String? category;
  String? result;
  String? range;
  String? unit;
  String? type;

  Investigations(
      {this.date,
        this.category,
        this.result,
        this.range,
        this.unit,
        this.type});

  Investigations.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    category = json['category'];
    result = json['result'];
    range = json['range'];
    unit = json['unit'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['category'] = category;
    data['result'] = result;
    data['range'] = range;
    data['unit'] = unit;
    data['type'] = type;
    return data;
  }
}
