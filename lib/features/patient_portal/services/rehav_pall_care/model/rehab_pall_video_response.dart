class RehabPallVideoResponse {
  bool? success;
  List<RehabilitativePallVideo>? rehabilitativePallVideo;
  String? token;
  String? tokenType;

  RehabPallVideoResponse(
      {this.success, this.rehabilitativePallVideo, this.token, this.tokenType});

  RehabPallVideoResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['rehabilitative_pall_video'] != null) {
      rehabilitativePallVideo = <RehabilitativePallVideo>[];
      json['rehabilitative_pall_video'].forEach((v) {
        rehabilitativePallVideo!.add(new RehabilitativePallVideo.fromJson(v));
      });
    }
    token = json['token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (rehabilitativePallVideo != null) {
      data['rehabilitative_pall_video'] =
          rehabilitativePallVideo!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    data['token_type'] = tokenType;
    return data;
  }
}

class RehabilitativePallVideo {
  int? id;
  String? companyId;
  String? menuId;
  String? videoLink;
  String? videoTitle;
  Null? link;
  Null? status;
  String? createdAt;
  String? updatedAt;

  RehabilitativePallVideo(
      {this.id,
        this.companyId,
        this.menuId,
        this.videoLink,
        this.videoTitle,
        this.link,
        this.status,
        this.createdAt,
        this.updatedAt});

  RehabilitativePallVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    menuId = json['menu_id'];
    videoLink = json['video_link'];
    videoTitle = json['video_title'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['menu_id'] = menuId;
    data['video_link'] = videoLink;
    data['video_title'] = videoTitle;
    data['link'] = link;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
