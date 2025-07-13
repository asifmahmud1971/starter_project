import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/data/network/api_client.dart';
import 'package:medPilot/data/network/api_failure.dart';
import 'package:medPilot/data/network/api_request.dart';
import 'package:medPilot/data/network/api_urls.dart';
import 'package:medPilot/features/patient_portal/cart/model/cart_response.dart';

import 'cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImp implements CartRepository {
  CartRepositoryImp({required this.apiRequest});

  final ApiRequest apiRequest;

  @override
  Future<Either<ApiFailure, CartResponse>> getCartView(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.viewCart,
        method: Method.get,
        params: params,
        fromJson: CartResponse.fromJson);
  }
 @override
  Future<Either<ApiFailure, dynamic>> addProduct(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.addToCart,
        method: Method.post,
        params: params);
  }
 @override
  Future<Either<ApiFailure, CartResponse>> updateCart(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.updateOrder,
        method: Method.post,
        params: params,
        fromJson: CartResponse.fromJson);
  }
 @override
  Future<Either<ApiFailure, dynamic>> deleteCart(
      Map<String, dynamic> params) {
    return apiRequest.performRequest(
        url: ApiUrls.removeCartItem,
        method: Method.post,
        params: params);
  }

}
