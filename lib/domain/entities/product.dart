import '../../data/models/product_model.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  });

  // Factory method to convert from ProductModel to Product entity
  factory Product.fromModel(ProductModel model) {
    return Product(
      id: model.id,
      title: model.title,
      price: model.price ?? 0.0,
      description: model.description ?? '',
      category: model.category ?? '',
      image: model.image ?? '',
      rate: model.rating?.rate ?? 0.0,
      count: model.rating?.count ?? 0,
    );
  }
}
