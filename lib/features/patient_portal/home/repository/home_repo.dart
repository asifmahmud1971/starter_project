import 'package:dartz/dartz.dart';

import '../../../../data/network/api_failure.dart';

abstract class HomeRepository {
  Future<Either<ApiFailure, dynamic>> addAudioFavorite(
      Map<String, dynamic> params);
}
