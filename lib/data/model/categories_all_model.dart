class CategoriesAllModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;

  CategoriesAllModel(
      {this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage});

  CategoriesAllModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_all_id'];
    categoriesName = json['categories_all_name'];
    categoriesNameAr = json['categories_all_name_ar'];
    categoriesImage = json['categories_all_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_all_id'] = this.categoriesId;
    data['categories_all_name'] = this.categoriesName;
    data['categories_all_name_ar'] = this.categoriesNameAr;
    data['categories_all_image'] = this.categoriesImage;
    return data;
  }
}
