import 'package:clean_project/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getAllProducts();
}
