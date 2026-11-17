class Product {
  final int id;
  final String title;
  final num price;
  final String image;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.description,
  });

  String getPrice() {
    return ("${this.price.toStringAsFixed(2)}€");
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'price': this.price,
      'image': this.image,
      'category': this.category,
      'description': this.description,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      image: map['image'] as String,
      category: map['category'] as String,
      description: map['description'] as String,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          price == other.price &&
          image == other.image &&
          category == other.category &&
          description == other.description;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      image.hashCode ^
      category.hashCode ^
      description.hashCode;
}
