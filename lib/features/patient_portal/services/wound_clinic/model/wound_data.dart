
import 'package:medPilot/core/app/app_config.dart';
import 'package:medPilot/core/constants/strings.dart';

class WoundData {
  WoundData({
    this.id,
    this.companyId,
    this.patientId,
    this.date,
    this.image,
    this.woundStage,
    this.width,
    this.length,
    this.depth,
    this.edges,
    this.options,
    this.exposed,
    this.smell,
    this.infection,
    this.appearance,
    this.exudateAmount,
    this.exudateNature,
    this.odour,
    this.color,
    this.painScore,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.descriptions
  });

  WoundData.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    image = appBaseUrl+json['image'];
    woundStage = json['wound_stage'];
    width = json['width'];
    length = json['length'];
    depth = json['depth'];
    edges = json['edges'];
    options = json['options'];
    exposed = json['exposed'];
    smell = json['smell'];
    infection = json['infection'];
    appearance = json['appearance'];
    exudateAmount = json['exudate_amount'];
    exudateNature = json['exudate_nature'];
    odour = json['odour'];
    color = json['color'];
    painScore = json['pain_score'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['descriptions'] != null) {
      descriptions = <Descriptions>[];
      json['descriptions'].forEach((v) {
        descriptions!.add(new Descriptions.fromJson(v));
      });
    }
  }
  num? id;
  dynamic companyId;
  String? patientId;
  String? date;
  String? image;
  dynamic woundStage;
  dynamic width;
  dynamic length;
  dynamic depth;
  dynamic edges;
  dynamic options;
  dynamic exposed;
  dynamic smell;
  dynamic infection;
  dynamic appearance;
  dynamic exudateAmount;
  dynamic exudateNature;
  dynamic odour;
  dynamic color;
  dynamic painScore;
  dynamic type;
  String? createdAt;
  String? updatedAt;
  List<Descriptions>? descriptions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['image'] = image;
    map['wound_stage'] = woundStage;
    map['width'] = width;
    map['length'] = length;
    map['depth'] = depth;
    map['edges'] = edges;
    map['options'] = options;
    map['exposed'] = exposed;
    map['smell'] = smell;
    map['infection'] = infection;
    map['appearance'] = appearance;
    map['exudate_amount'] = exudateAmount;
    map['exudate_nature'] = exudateNature;
    map['odour'] = odour;
    map['color'] = color;
    map['pain_score'] = painScore;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (descriptions != null) {
      map['descriptions'] = descriptions!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


class Descriptions {
  int? id;
  String? assId;
  String? companyId;
  String? patientId;
  String? date;
  String? location;
  String? site;
  String? occured;
  String? patternOfWound;
  String? createdAt;
  String? updatedAt;

  Descriptions(
      {this.id,
        this.assId,
        this.companyId,
        this.patientId,
        this.date,
        this.location,
        this.site,
        this.occured,
        this.patternOfWound,
        this.createdAt,
        this.updatedAt});

  Descriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assId = json['ass_id'];
    companyId = json['company_id'];
    patientId = json['patient_id'];
    date = json['date'];
    location = json['location'];
    site = json['site'];
    occured = json['occured'];
    patternOfWound = json['pattern_of_wound'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['ass_id'] = assId;
    data['company_id'] = companyId;
    data['patient_id'] = patientId;
    data['date'] = date;
    data['location'] = location;
    data['site'] = site;
    data['occured'] = occured;
    data['pattern_of_wound'] = patternOfWound;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
