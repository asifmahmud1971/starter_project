part of 'cart_cubit.dart';

class CartState extends Equatable {
  final AppStatus appStatus;
  final CartResponse? cartResponse;

  const CartState({
    this.appStatus = AppStatus.initial,
    this.cartResponse,
  });

  CartState copyWith({
    final AppStatus? appStatus,
    final CartResponse? cartResponse,
  }) {
    return CartState(
      appStatus: appStatus ?? this.appStatus,
      cartResponse: cartResponse ?? this.cartResponse,
    );
  }

  @override
  List<Object> get props => [
        appStatus,
        cartResponse ?? {},
      ];
}
