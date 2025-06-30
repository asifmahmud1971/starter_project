class ConsultantsResponse {
  bool? success;
  List<ConDoctor>? doctorList;
  String? token;
  String? tokenType;

  ConsultantsResponse({this.success, this.doctorList, this.token, this.tokenType});

  ConsultantsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['doctor'] != null) {
      doctorList = <ConDoctor>[];
      json['doctor'].forEach((v) {
        doctorList!.add(new ConDoctor.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    if (doctorList != null) {
      data['doctor'] = doctorList!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class ConDoctor {
  String? name;
  String? specialty;
  String? qualifications;
  String? hospital;
  String? rating;
  String? reviewCount;
  String? image;

  ConDoctor(
      {this.name,
        this.specialty,
        this.qualifications,
        this.hospital,
        this.rating,
        this.reviewCount,
        this.image});

  ConDoctor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    specialty = json['specialty'];
    qualifications = json['qualifications'];
    hospital = json['hospital'];
    rating = json['rating'];
    reviewCount = json['reviewCount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['specialty'] = specialty;
    data['qualifications'] = qualifications;
    data['hospital'] = hospital;
    data['rating'] = rating;
    data['reviewCount'] = reviewCount;
    data['image'] = image;
    return data;
  }
}
