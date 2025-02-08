import 'package:clean_project/domain/entities/product.dart';

import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts({required this.repository});

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
