import 'package:demo/core/constants/app_strings.dart';

import '../../../../generated/assets.dart';

class CarouselModel {
  CarouselModel({this.aboutImage, this.title, this.desc, this.image});

  final String? title;
  final String? desc;
  final String? image;
  final String? aboutImage;
}

List<CarouselModel> carouselList = [
  CarouselModel(
    title: AppStrings.cTitleOne,
    desc: AppStrings.cDescOne,
    image: Assets.imagesLady,
    aboutImage: Assets.imagesImage44,
  ),
  CarouselModel(
    title: AppStrings.cTitleTwo,
    desc: AppStrings.cDescTwo,
    image: Assets.imagesGents,
    aboutImage: Assets.imagesImage45,
  ),
];

List<CarouselModel> carouselList2 = [
  CarouselModel(
    title: AppStrings.cTitleTwo,
    desc: AppStrings.cDescTwo,
    image: Assets.imagesGents,
    aboutImage: Assets.imagesImage45,
  ),
  CarouselModel(
    title: AppStrings.cTitleOne,
    desc: AppStrings.cDescOne,
    image: Assets.imagesLady,
    aboutImage: Assets.imagesImage44,
  ),
];
