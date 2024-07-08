class Product {
  String id;
  String nama;
  int price;
  int qty;
  String attr;
  int weight;
  


  Product({
    required this.id,
    required this.nama,
    required this.price,
    required this.qty,
    required this.attr,
    required this.weight,
    
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      nama: json['name'],
      price: json['price'],
      qty: json['qty'],
      attr: json['attr'],
      weight: json['weight'],
    );
  }
}


