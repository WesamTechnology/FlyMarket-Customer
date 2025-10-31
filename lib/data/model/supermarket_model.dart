class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'isFavorite': isFavorite,
  };
}
