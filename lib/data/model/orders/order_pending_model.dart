class OrderPendingModel {
  int? ordersId;
  int? ordersUsersid;
  int? ordersSupermarketid;
  int? ordersAddress;
  int? ordersType;
  double? ordersPricedelivery;
  double? ordersPrice;
  double? ordersTotalprice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoteRating;
  String? ordersDatetime;
  int? ordersPaymentmethod;
  int? ordersStatus;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  int? supermarketId;
  String? supermarketName;
  String? supermarketEmail;
  String? supermarketNameAr;
  String? supermarketPhone;
  String? supermarketImage;
  String? supermarketLocation;
  String? supermarketTimeOpen;
  int? roleId;
  int? status;
  String? createdAt;
  String? firebaseUid;

  OrderPendingModel(
      {this.ordersId,
        this.ordersUsersid,
        this.ordersSupermarketid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPricedelivery,
        this.ordersPrice,
        this.ordersTotalprice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoteRating,
        this.ordersDatetime,
        this.ordersPaymentmethod,
        this.ordersStatus,
        this.addressId,
        this.addressUsersid,
        this.addressName,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.supermarketId,
        this.supermarketName,
        this.supermarketEmail,
        this.supermarketNameAr,
        this.supermarketPhone,
        this.supermarketImage,
        this.supermarketLocation,
        this.supermarketTimeOpen,
        this.roleId,
        this.status,
        this.createdAt,
        this.firebaseUid});

  OrderPendingModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersSupermarketid = json['orders_supermarketid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = (json['orders_pricedelivery'] as num?)?.toDouble();
    ordersPrice = (json['orders_price'] as num?)?.toDouble();
    ordersTotalprice = (json['orders_totalprice'] as num?)?.toDouble();
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoteRating = json['orders_noterating'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    supermarketId = json['supermarket_id'];
    supermarketName = json['supermarket_name'];
    supermarketEmail = json['supermarket_email'];
    supermarketNameAr = json['supermarket_name_ar'];
    supermarketPhone = json['supermarket_phone'];
    supermarketImage = json['supermarket_image'];
    supermarketLocation = json['supermarket_location'];
    supermarketTimeOpen = json['supermarket_time_open'];
    roleId = json['role_id'];
    status = json['status'];
    createdAt = json['created_at'];
    firebaseUid = json['firebase_uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_supermarketid'] = this.ordersSupermarketid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_noterating'] = this.ordersNoteRating;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_status'] = this.ordersStatus;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['supermarket_id'] = this.supermarketId;
    data['supermarket_name'] = this.supermarketName;
    data['supermarket_email'] = this.supermarketEmail;
    data['supermarket_name_ar'] = this.supermarketNameAr;
    data['supermarket_phone'] = this.supermarketPhone;
    data['supermarket_image'] = this.supermarketImage;
    data['supermarket_location'] = this.supermarketLocation;
    data['supermarket_time_open'] = this.supermarketTimeOpen;
    data['role_id'] = this.roleId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['firebase_uid'] = this.firebaseUid;
    return data;
  }
}
