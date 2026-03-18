class ItemsModel {
  int? itmesId;
  String? itmesName;
  String? itmesNameAr;
  String? itmesDesc;
  String? itmesDescAr;
  String? itmesImage;
  int? itmesCount;
  int? itmesActive;
  double? itmesPrice;
  double? itmesDiscount;
  String? itmesDate;
  int? itmesCat;
  int? itmesCatAll;
  int? itmesSuper;
  double? itemspricedisount;
  int? supermarketId;
  String? supermarketName;
  String? supermarketEmail;
  String? supermarketNameAr;
  String? supermarketPhone;
  String? supermarketImage;
  String? supermarketLocation;
  double? supermarketLat;
  double? supermarketLong;
  String? supermarketTimeOpen;
  int? favorite;

  ItemsModel(
      {this.itmesId,
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
        this.itemspricedisount,
        this.supermarketId,
        this.supermarketName,
        this.supermarketEmail,
        this.supermarketNameAr,
        this.supermarketPhone,
        this.supermarketImage,
        this.supermarketLocation,
        this.supermarketLat,
        this.supermarketLong,
        this.supermarketTimeOpen,
        this.favorite,
      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itmesId = json['itmes_id'];
    itmesName = json['itmes_name'];
    itmesNameAr = json['itmes_name_ar'];
    itmesDesc = json['itmes_desc'];
    itmesDescAr = json['itmes_desc_ar'];
    itmesImage = json['itmes_image'];
    itmesCount = json['itmes_count'];
    itmesActive = json['itmes_active'];
    itmesPrice = (json['itmes_price'] as num?)?.toDouble();
    itmesDiscount = (json['itmes_discount'] as num?)?.toDouble();
    itmesDate = json['itmes_date'];
    itmesCat = json['itmes_cat'];
    itmesCatAll = json['itmes_cat_all'];
    itmesSuper = json['itmes_super'];
    itemspricedisount = (json['itemspricedisount'] as num?)?.toDouble();
    supermarketId = json['supermarket_id'];
    supermarketName = json['supermarket_name'];
    supermarketEmail = json['supermarket_email'];
    supermarketNameAr = json['supermarket_name_ar'];
    supermarketPhone = json['supermarket_phone'];
    supermarketImage = json['supermarket_image'];
    supermarketLocation = json['supermarket_location'];
    supermarketLat = (json['supermarket_lat'] as num?)?.toDouble();
    supermarketLong = (json['supermarket_long'] as num?)?.toDouble();
    supermarketTimeOpen = json['supermarket_time_open'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['itemspricedisount'] = this.itemspricedisount;
    data['supermarket_id'] = this.supermarketId;
    data['supermarket_name'] = this.supermarketName;
    data['supermarket_email'] = this.supermarketEmail;
    data['supermarket_name_ar'] = this.supermarketNameAr;
    data['supermarket_phone'] = this.supermarketPhone;
    data['supermarket_image'] = this.supermarketImage;
    data['supermarket_location'] = this.supermarketLocation;
    data['supermarket_lat'] = this.supermarketLat;
    data['supermarket_long'] = this.supermarketLong;
    data['supermarket_time_open'] = this.supermarketTimeOpen;
    data['favorite'] = this.favorite;
    return data;
  }
}
