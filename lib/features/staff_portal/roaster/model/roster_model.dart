class RosterModel {
  RosterModel({
      this.success, 
      this.rosters, 
      this.token, 
      this.tokenType,});

  RosterModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['rosters'] != null) {
      rosters = [];
      json['rosters'].forEach((v) {
        rosters?.add(Rosters.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }
  bool? success;
  List<Rosters>? rosters;
  String? token;
  String? tokenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (rosters != null) {
      map['rosters'] = rosters?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }

}

class Rosters {
  Rosters({
      this.date, 
      this.label, 
      this.isToday, 
      this.entries,});

  Rosters.fromJson(dynamic json) {
    date = json['date'];
    label = json['label'];
    isToday = json['is_today'];
    if (json['entries'] != null) {
      entries = [];
      json['entries'].forEach((v) {
        entries?.add(Entries.fromJson(v));
      });
    }
  }
  String? date;
  String? label;
  bool? isToday;
  List<Entries>? entries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['label'] = label;
    map['is_today'] = isToday;
    if (entries != null) {
      map['entries'] = entries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Entries {
  Entries({
      this.type, 
      this.startTime, 
      this.endTime, 
      this.shiftName, 
      this.staffName, 
      this.designation, 
      this.workTime, 
      this.location,});

  Entries.fromJson(dynamic json) {
    type = json['type'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    shiftName = json['shift_name'];
    staffName = json['staff_name'];
    designation = json['designation'];
    workTime = json['work_time'];
    location = json['location'];
  }
  String? type;
  String? startTime;
  String? endTime;
  String? shiftName;
  String? staffName;
  dynamic designation;
  String? workTime;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    map['shift_name'] = shiftName;
    map['staff_name'] = staffName;
    map['designation'] = designation;
    map['work_time'] = workTime;
    map['location'] = location;
    return map;
  }

}