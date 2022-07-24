class Products {
  int? id;
  String? title;
  double? price;
  String? image;

  Products({
    this.id,
    this.title,
    this.price,
    this.image,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;

    return data;
  }

  static List<Products> fromJsonList(List list) {
    if (list.isEmpty) return List<Products>.empty();
    return list.map((item) => Products.fromJson(item)).toList();
  }
}
