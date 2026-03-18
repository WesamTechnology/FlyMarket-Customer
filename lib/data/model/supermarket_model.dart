class SupermarketModel {
  int? supermarketId;
  String? supermarketName;
  String? supermarketNameAr;
  String? supermarketPhone;
  String? supermarketImage;
  String? supermarketLocation;
  double? supermarketLat;
  double? supermarketLong;
  String? supermarketTimeOpen;

  SupermarketModel(
      {this.supermarketId,
        this.supermarketName,
        this.supermarketNameAr,
        this.supermarketPhone,
        this.supermarketImage,
        this.supermarketLocation,
        this.supermarketLat,
        this.supermarketLong,
        this.supermarketTimeOpen});

  SupermarketModel.fromJson(Map<String, dynamic> json) {
    supermarketId = json['supermarket_id'];
    supermarketName = json['supermarket_name'];
    supermarketNameAr = json['supermarket_name_ar'];
    supermarketPhone = json['supermarket_phone'];
    supermarketImage = json['supermarket_image'];
    supermarketLocation = json['supermarket_location'];
    supermarketLat = (json['supermarket_lat'] as num?)?.toDouble();
    supermarketLong = (json['supermarket_long'] as num?)?.toDouble();
    supermarketTimeOpen = json['supermarket_time_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['supermarket_id'] = this.supermarketId;
    data['supermarket_name'] = this.supermarketName;
    data['supermarket_name_ar'] = this.supermarketNameAr;
    data['supermarket_phone'] = this.supermarketPhone;
    data['supermarket_image'] = this.supermarketImage;
    data['supermarket_location'] = this.supermarketLocation;
    data['supermarket_lat'] = this.supermarketLat;
    data['supermarket_long'] = this.supermarketLong;
    data['supermarket_time_open'] = this.supermarketTimeOpen;
    return data;
  }
}
