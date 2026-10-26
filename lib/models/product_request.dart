class ProductRequest {
  
  final String name;
  final double price;

  ProductRequest({ required this.name, required this.price});

    Map<String, Object> toJson(){

    return {
      
      "name":name,
      "price":price
    };
    }
}
