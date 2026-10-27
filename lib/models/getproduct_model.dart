class GetproductModel {
  final String name;
  final double price;

  GetproductModel({required this.name, required this.price});

  factory GetproductModel.fromJson(Map<String, dynamic> json) {
    return GetproductModel(
      name: json["name"],
      price: (json['price'] as num).toDouble(),
     );
  }
}
