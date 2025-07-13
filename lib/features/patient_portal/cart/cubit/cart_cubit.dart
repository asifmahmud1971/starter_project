import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medPilot/core/app/app_context.dart';
import 'package:medPilot/core/app/app_preference.dart';
import 'package:medPilot/core/components/custom_progress_loader.dart';
import 'package:medPilot/core/components/custom_snack_bar.dart';
import 'package:medPilot/core/enum/app_status.dart';
import 'package:medPilot/features/patient_portal/cart/model/cart_response.dart';
import 'package:medPilot/features/patient_portal/cart/repository/cart_repository.dart';
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
          showCustomSnackBar(
            context: GetContext.context,
            message: data["message"],
          );
        },
      );

      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

  Future<void> updateProductCart({
    int? cartId,
    int? quantity
}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    Map<String, dynamic> data={
      "cart_id": [cartId.toString()],
      "quantity": [quantity.toString()]
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

  void incrementItem(int value,{int? cartId}){
    int? num=value+1;
    if(1<value){
      updateProductCart(cartId: cartId,quantity: num);
    }
  }

  void decrementItem(int value,{int? cartId}){
    int? num=value-1;
    if(0<value){
      updateProductCart(cartId: cartId,quantity: num);
    }
  }


  Future<void> deleteProductCart({int? cartId}) async {
    showProgressDialog();
    emit(state.copyWith(appStatus: AppStatus.loading));
    Map<String, dynamic> data={
      "cart_id": cartId.toString(),
    };
    try {
      final response = await cartRepository.deleteCart(data);

      response.fold(
        (failure) {},
        (data) async {
          emit(state.copyWith(
              appStatus: AppStatus.success));
          getCartProduct();
        },
      );
      dismissProgressDialog();
    } catch (e) {
      dismissProgressDialog();
    }
  }

}
