import 'package:clean_project/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../../domain/use_cases/get_products.dart';

class ProductProvider extends ChangeNotifier {
  final GetProducts getProductsUseCase;
  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  ProductProvider({required this.getProductsUseCase});

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _products = await getProductsUseCase.call();
    } catch (e) {
      _errorMessage = "ডাটা লোড করতে ব্যর্থ হয়েছে: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
