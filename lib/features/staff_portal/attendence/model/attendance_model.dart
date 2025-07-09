class AttendanceModel {
  AttendanceModel({
      this.success, 
      this.date, 
      this.day, 
      this.data,});

  AttendanceModel.fromJson(dynamic json) {
    success = json['success'];
    date = json['date'];
    day = json['day'];
    data = json['data'] != null ? AttendanceData.fromJson(json['data']) : null;
  }
  bool? success;
  String? date;
  String? day;
  AttendanceData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['date'] = date;
    map['day'] = day;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class AttendanceData {
  AttendanceData({
      this.checkIn, 
      this.checkOut, 
      this.breakStart, 
      this.breakEnd,});

  AttendanceData.fromJson(dynamic json) {
    checkIn = json['check_in'] != null ? CheckIn.fromJson(json['check_in']) : null;
    checkOut = json['check_out'] != null ? CheckOut.fromJson(json['check_out']) : null;
    breakStart = json['break_start'] != null ? BreakStart.fromJson(json['break_start']) : null;
    breakEnd = json['break_end'] != null ? BreakEnd.fromJson(json['break_end']) : null;
  }
  CheckIn? checkIn;
  CheckOut? checkOut;
  BreakStart? breakStart;
  BreakEnd? breakEnd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (checkIn != null) {
      map['check_in'] = checkIn?.toJson();
    }
    if (checkOut != null) {
      map['check_out'] = checkOut?.toJson();
    }
    if (breakStart != null) {
      map['break_start'] = breakStart?.toJson();
    }
    if (breakEnd != null) {
      map['break_end'] = breakEnd?.toJson();
    }
    return map;
  }

}

class BreakEnd {
  BreakEnd({
      this.scheduled, 
      this.actual, 
      this.canEndBreak,});

  BreakEnd.fromJson(dynamic json) {
    scheduled = json['scheduled'];
    actual = json['actual'];
    canEndBreak = json['can_end_break'];
  }
  String? scheduled;
  dynamic actual;
  bool? canEndBreak;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduled'] = scheduled;
    map['actual'] = actual;
    map['can_end_break'] = canEndBreak;
    return map;
  }

}

class BreakStart {
  BreakStart({
      this.scheduled, 
      this.actual, 
      this.canStartBreak,});

  BreakStart.fromJson(dynamic json) {
    scheduled = json['scheduled'];
    actual = json['actual'];
    canStartBreak = json['can_start_break'];
  }
  String? scheduled;
  dynamic actual;
  bool? canStartBreak;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduled'] = scheduled;
    map['actual'] = actual;
    map['can_start_break'] = canStartBreak;
    return map;
  }

}

class CheckOut {
  CheckOut({
      this.scheduled, 
      this.actual, 
      this.canCheckOut,});

  CheckOut.fromJson(dynamic json) {
    scheduled = json['scheduled'];
    actual = json['actual'];
    canCheckOut = json['can_check_out'];
  }
  String? scheduled;
  dynamic actual;
  bool? canCheckOut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduled'] = scheduled;
    map['actual'] = actual;
    map['can_check_out'] = canCheckOut;
    return map;
  }

}

class CheckIn {
  CheckIn({
      this.scheduled, 
      this.actual, 
      this.canCheckIn, 
      this.checkInUrl,});

  CheckIn.fromJson(dynamic json) {
    scheduled = json['scheduled'];
    actual = json['actual'];
    canCheckIn = json['can_check_in'];
    checkInUrl = json['check_in_url'];
  }
  String? scheduled;
  dynamic actual;
  bool? canCheckIn;
  String? checkInUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['scheduled'] = scheduled;
    map['actual'] = actual;
    map['can_check_in'] = canCheckIn;
    map['check_in_url'] = checkInUrl;
    return map;
  }

}