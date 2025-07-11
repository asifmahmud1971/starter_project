class CartResponse {
  bool? success;
  List<CartItems>? cartItems;
  int? grandTotal;

  CartResponse({this.success, this.cartItems, this.grandTotal});

  CartResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    grandTotal = json['grand_total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['grand_total'] = grandTotal;
    return data;
  }
}

class CartItems {
  int? cartId;
  String? type;
  String? name;
  String? image;
  String? price;
  String? quantity;
  int? subtotal;

  CartItems(
      {this.cartId,
        this.type,
        this.name,
        this.image,
        this.price,
        this.quantity,
        this.subtotal});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_id'] = cartId;
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['price'] = price;
    data['quantity'] = quantity;
    data['subtotal'] = subtotal;
    return data;
  }
}
