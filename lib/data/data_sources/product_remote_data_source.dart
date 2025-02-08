import 'package:clean_project/data/models/product_model.dart';
import 'package:dio/dio.dart';

class ProductRemoteDataSource {
  final Dio dio = Dio(); // Dio ইনস্ট্যান্স তৈরি করা হয়েছে

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('ডাটা লোড করতে ব্যর্থ হয়েছে!');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }
}
