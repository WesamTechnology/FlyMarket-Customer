class SupermarketModel {
  int? supermarketId;
  String? supermarketName;
  String? supermarketNameAr;
  String? supermarketPhone;
  String? supermarketImage;
  String? supermarketLocation;
  String? supermarketTimeOpen;

  SupermarketModel(
      {this.supermarketId,
        this.supermarketName,
        this.supermarketNameAr,
        this.supermarketPhone,
        this.supermarketImage,
        this.supermarketLocation,
        this.supermarketTimeOpen});

  SupermarketModel.fromJson(Map<String, dynamic> json) {
    supermarketId = json['supermarket_id'];
    supermarketName = json['supermarket_name'];
    supermarketNameAr = json['supermarket_name_ar'];
    supermarketPhone = json['supermarket_phone'];
    supermarketImage = json['supermarket_image'];
    supermarketLocation = json['supermarket_location'];
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
    data['supermarket_time_open'] = this.supermarketTimeOpen;
    return data;
  }
}
