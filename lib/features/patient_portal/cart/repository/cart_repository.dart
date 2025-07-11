import 'package:dartz/dartz.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/features/patient_portal/cart/model/cart_response.dart';

abstract class CartRepository {
  Future<Either<ApiFailure, CartResponse>> getCartView(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> addProduct(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, CartResponse>> updateCart(
      Map<String, dynamic> params);
  Future<Either<ApiFailure, dynamic>> deleteCart(
      Map<String, dynamic> params);

}
