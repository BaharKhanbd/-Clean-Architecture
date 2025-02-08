import 'package:clean_project/domain/entities/product.dart';

import '../../domain/repositories/product_repository.dart';

import '../data_sources/product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      List<ProductModel> productModels = await remoteDataSource.fetchProducts();
      return productModels.map((model) => Product.fromModel(model)).toList();
    } catch (e) {
      throw Exception("প্রোডাক্ট লোড করতে সমস্যা হচ্ছে: $e");
    }
  }
}
