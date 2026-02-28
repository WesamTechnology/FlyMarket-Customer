class OrdersDetailsModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
  int? itmesId;
  String? itmesName;
  String? itmesNameAr;
  String? itmesDesc;
  String? itmesDescAr;
  String? itmesImage;
  int? itmesCount;
  int? itmesActive;
  int? itmesPrice;
  int? itmesDiscount;
  String? itmesDate;
  int? itmesCat;

  OrdersDetailsModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
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
        this.itmesCat});

  OrdersDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    cartOrders = json['cart_orders'];
    itmesId = json['itmes_id'];
    itmesName = json['itmes_name'];
    itmesNameAr = json['itmes_name_ar'];
    itmesDesc = json['itmes_desc'];
    itmesDescAr = json['itmes_desc_ar'];
    itmesImage = json['itmes_image'];
    itmesCount = json['itmes_count'];
    itmesActive = json['itmes_active'];
    itmesPrice = json['itmes_price'];
    itmesDiscount = json['itmes_discount'];
    itmesDate = json['itmes_date'];
    itmesCat = json['itmes_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
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
    return data;
  }
}
