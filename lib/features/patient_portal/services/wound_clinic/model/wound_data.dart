
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
    this.updatedAt,});

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
    return map;
  }

}