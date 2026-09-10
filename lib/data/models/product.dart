class Product {
  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });

  final int id;
  final String name;
  final String image;
  final double price;
  final String description;
}