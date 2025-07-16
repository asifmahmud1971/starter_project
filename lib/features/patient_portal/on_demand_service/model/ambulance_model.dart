class AmbulanceResponse {
  bool? success;
  List<AmbulanceRequest>? ambulanceRequest;
  String? token;

  AmbulanceResponse(
      {this.success, this.ambulanceRequest, this.token,});

  AmbulanceResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['ambulance_request'] != null) {
      ambulanceRequest = <AmbulanceRequest>[];
      json['ambulance_request'].forEach((v) {
        ambulanceRequest!.add(AmbulanceRequest.fromJson(v));
      });
    }
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (ambulanceRequest != null) {
      data['ambulance_request'] =
          ambulanceRequest!.map((v) => v.toJson()).toList();
    }
    data['token'] = token;
    return data;
  }
}

class AmbulanceRequest {
  int? id;
  String? companyId;
  String? clientId;
  Null? branchId;
  String? invoiceNo;
  String? invoiceDate;
  String? whenDate;
  String? whenTime;
  Null? address;
  String? amount;
  String? discount;
  Null? subtotalAmount;
  String? deliveryCharge;
  String? serviceCharge;
  String? vat;
  Null? vatPercent;
  String? subTotal;
  String? total;
  Null? advance;
  Null? advanceId;
  String? due;
  String? paymentMethod;
  String? paymentStatus;
  String? smsCode;
  Null? teleMedicineId;
  String? totalBill;
  Null? orderBy;
  Null? deliveryStatus;
  Null? collectionCharge;
  String? ambulance;
  String? ambulanceInfo;
  String? createdAt;
  String? updatedAt;

  AmbulanceRequest(
      {this.id,
        this.companyId,
        this.clientId,
        this.branchId,
        this.invoiceNo,
        this.invoiceDate,
        this.whenDate,
        this.whenTime,
        this.address,
        this.amount,
        this.discount,
        this.subtotalAmount,
        this.deliveryCharge,
        this.serviceCharge,
        this.vat,
        this.vatPercent,
        this.subTotal,
        this.total,
        this.advance,
        this.advanceId,
        this.due,
        this.paymentMethod,
        this.paymentStatus,
        this.smsCode,
        this.teleMedicineId,
        this.totalBill,
        this.orderBy,
        this.deliveryStatus,
        this.collectionCharge,
        this.ambulance,
        this.ambulanceInfo,
        this.createdAt,
        this.updatedAt});

  AmbulanceRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    clientId = json['client_id'];
    branchId = json['branch_id'];
    invoiceNo = json['invoice_no'];
    invoiceDate = json['invoice_date'];
    whenDate = json['when_date'];
    whenTime = json['When_time'];
    address = json['address'];
    amount = json['amount'];
    discount = json['discount'];
    subtotalAmount = json['subtotal_amount'];
    deliveryCharge = json['delivery_charge'];
    serviceCharge = json['service_charge'];
    vat = json['vat'];
    vatPercent = json['vat_percent'];
    subTotal = json['sub_total'];
    total = json['total'];
    advance = json['advance'];
    advanceId = json['advance_id'];
    due = json['due'];
    paymentMethod = json['payment_method'];
    paymentStatus = json['payment_status'];
    smsCode = json['sms_code'];
    teleMedicineId = json['tele_medicine_id'];
    totalBill = json['total_bill'];
    orderBy = json['order_by'];
    deliveryStatus = json['delivery_status'];
    collectionCharge = json['collection_charge'];
    ambulance = json['ambulance'];
    ambulanceInfo = json['ambulance_info'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['client_id'] = clientId;
    data['branch_id'] = branchId;
    data['invoice_no'] = invoiceNo;
    data['invoice_date'] = invoiceDate;
    data['when_date'] = whenDate;
    data['When_time'] = whenTime;
    data['address'] = address;
    data['amount'] = amount;
    data['discount'] = discount;
    data['subtotal_amount'] = subtotalAmount;
    data['delivery_charge'] = deliveryCharge;
    data['service_charge'] = serviceCharge;
    data['vat'] = vat;
    data['vat_percent'] = vatPercent;
    data['sub_total'] = subTotal;
    data['total'] = total;
    data['advance'] = advance;
    data['advance_id'] = advanceId;
    data['due'] = due;
    data['payment_method'] = paymentMethod;
    data['payment_status'] = paymentStatus;
    data['sms_code'] = smsCode;
    data['tele_medicine_id'] = teleMedicineId;
    data['total_bill'] = totalBill;
    data['order_by'] = orderBy;
    data['delivery_status'] = deliveryStatus;
    data['collection_charge'] = collectionCharge;
    data['ambulance'] = ambulance;
    data['ambulance_info'] = ambulanceInfo;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
