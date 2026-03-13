class OrdersDetailsModel {
  double? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartSuperid;
  int? cartOrders;
  int? itmesId;
  String? itmesName;
  String? itmesNameAr;
  String? itmesDesc;
  String? itmesDescAr;
  String? itmesImage;
  int? itmesCount;
  int? itmesActive;
  double? itmesPrice;
  int? itmesDiscount;
  String? itmesDate;
  int? itmesCat;
  int? itmesCatAll;
  int? itmesSuper;
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

  OrdersDetailsModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.cartSuperid,
        this.cartOrders,
        this.itmesId,
        this.itmesName,
        this.itmesNameAr,
        this.itmesDesc,
        this.itmesDescAr,
        this.itmesImage,
        this.itmesCount,
        this.itmesActive,
        this.itmesPrice,
        this.itmesDiscount,
        this.itmesDate,
        this.itmesCat,
        this.itmesCatAll,
        this.itmesSuper,
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

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = (json['itemsprice'] as num?)?.toDouble();
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartSuperid = json['cart_superid'];
    cartOrders = json['cart_orders'];
    itmesId = json['itmes_id'];
    itmesName = json['itmes_name'];
    itmesNameAr = json['itmes_name_ar'];
    itmesDesc = json['itmes_desc'];
    itmesDescAr = json['itmes_desc_ar'];
    itmesImage = json['itmes_image'];
    itmesCount = json['itmes_count'];
    itmesActive = json['itmes_active'];
    itmesPrice = (json['itmes_price'] as num?)?.toDouble();
    itmesDiscount = json['itmes_discount'];
    itmesDate = json['itmes_date'];
    itmesCat = json['itmes_cat'];
    itmesCatAll = json['itmes_cat_all'];
    itmesSuper = json['itmes_super'];
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
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_superid'] = this.cartSuperid;
    data['cart_orders'] = this.cartOrders;
    data['itmes_id'] = this.itmesId;
    data['itmes_name'] = this.itmesName;
    data['itmes_name_ar'] = this.itmesNameAr;
    data['itmes_desc'] = this.itmesDesc;
    data['itmes_desc_ar'] = this.itmesDescAr;
    data['itmes_image'] = this.itmesImage;
    data['itmes_count'] = this.itmesCount;
    data['itmes_active'] = this.itmesActive;
    data['itmes_price'] = this.itmesPrice;
    data['itmes_discount'] = this.itmesDiscount;
    data['itmes_date'] = this.itmesDate;
    data['itmes_cat'] = this.itmesCat;
    data['itmes_cat_all'] = this.itmesCatAll;
    data['itmes_super'] = this.itmesSuper;
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
