import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';

class TutorialModel {
  GlobalKey key;
  String id;
  String title;
  String desc;
  String page;
  bool isNextEnable;
  bool isPreviousEnable;
  bool isCircle;
  Alignment arrowAlignment;

  TutorialModel({
    required this.key,
    required this.id,
    required this.title,
    required this.desc,
    required this.page,
    required this.isNextEnable,
    required this.isPreviousEnable,
    required this.isCircle,
    required this.arrowAlignment,
  });

  factory TutorialModel.fromJson(Map<String, dynamic> json) => TutorialModel(
        key: json["key"],
        id: json["id"],
        title: json["title"],
        desc: json["desc"],
        page: json["page"],
        isNextEnable: json["is_next_enable"],
        isPreviousEnable: json["is_previous_enable"],
        isCircle: json["is_circle"],
        arrowAlignment: json["alignment"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "id": id,
        "title": title,
        "desc": desc,
        "page": page,
        "is_next_enable": isNextEnable,
        "is_previous_enable": isPreviousEnable,
        "is_circle": isCircle,
        "arrowAlignment": arrowAlignment,
      };
}

List<GlobalKey> homeKeys = List.generate(2, (index) => GlobalKey());
GlobalKey sessionTutorialKey = GlobalKey();
List<TutorialModel> homeTutorialList = [
  TutorialModel(
    key: homeKeys[0],
    id: AppStrings.homeTutorialOneTitle,
    title: AppStrings.homeTutorialOneTitle,
    desc: AppStrings.homeTutorialOneDesc,
    page: "1/2",
    isNextEnable: true,
    isPreviousEnable: false,
    isCircle: false,
    arrowAlignment: Alignment.topLeft,
  ),
  TutorialModel(
    key: homeKeys[1],
    id: AppStrings.homeTutorialTwoTitle,
    title: AppStrings.homeTutorialTwoTitle,
    desc: AppStrings.homeTutorialTwoDesc,
    page: "2/2",
    isNextEnable: false,
    isPreviousEnable: true,
    isCircle: true,
    arrowAlignment: Alignment.bottomRight,
  ),
];
TutorialModel sessionTutorial = TutorialModel(
  key: sessionTutorialKey,
  id: AppStrings.sessionTutorialTitle,
  title: AppStrings.sessionTutorialTitle,
  desc: AppStrings.sessionTutorialDesc,
  page: "1/1",
  isNextEnable: false,
  isPreviousEnable: false,
  isCircle: false,
  arrowAlignment: Alignment.bottomRight,
);
