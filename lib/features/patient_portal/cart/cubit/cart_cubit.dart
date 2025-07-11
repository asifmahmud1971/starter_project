import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/cart/model/cart_response.dart';
import 'package:medPilot/features/patient_portal/cart/repository/cart_repository.dart';
import 'package:medPilot/features/patient_portal/home/model/dashboard_permission.dart';
import 'package:medPilot/features/patient_portal/home/model/prescription_model.dart';
import 'package:medPilot/features/patient_portal/home/model/staff_permission_model.dart';
import 'package:medPilot/features/patient_portal/home/repository/home_repository.dart';
import '../../../../core/app/app_dependency.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepository) : super(const CartState());

  final CartRepository cartRepository;
  final _appPreferences = instance.get<AppPreferences>();
  Future<void> getCartProduct() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await cartRepository.getCartView({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, cartResponse: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> addProductToCart({
    String? productId,
    String? categoryId,
    String? quantity,
    String? type,
}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    Map<String, dynamic> data={
      "product_id": productId,
      "category_id": categoryId,
      "quantity": quantity,
      "type": type
    };
    try {
      final response = await cartRepository.addProduct(data);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> updateProductCart({
    String? cartId,
    String? quantity
}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    Map<String, dynamic> data={
      "cart_id": [cartId],
      "quantity": [quantity]
    };
    try {
      final response = await cartRepository.updateCart(data);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, cartResponse: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  void incrementItem(int value,{String? cartId}){
    int? num=value+1;
    if(0<value){
      updateProductCart(cartId: cartId,quantity: num.toString());
    }
  }

  void decrementItem(int value,{String? cartId}){
    int? num=value-1;
    if(0<value){
      updateProductCart(cartId: cartId,quantity: num.toString());
    }
  }


  Future<void> deleteProductCart() async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));

    try {
      final response = await cartRepository.deleteCart({});

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success, cartResponse: data));
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

}
