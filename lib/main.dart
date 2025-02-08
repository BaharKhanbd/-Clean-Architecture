import 'package:clean_project/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clean_project/presentation/pages/product_list_screen.dart';
import 'package:clean_project/presentation/providers/product_provider.dart';
import 'package:clean_project/domain/use_cases/get_products.dart';

import 'package:clean_project/data/data_sources/product_remote_data_source.dart';

void main() {
  final productRepository = ProductRepositoryImpl(
    remoteDataSource: ProductRemoteDataSource(),
  );
  final getProductsUseCase = GetProducts(repository: productRepository);

  runApp(MyApp(getProductsUseCase: getProductsUseCase));
}

class MyApp extends StatelessWidget {
  final GetProducts getProductsUseCase;

  const MyApp({super.key, required this.getProductsUseCase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              ProductProvider(getProductsUseCase: getProductsUseCase)
                ..fetchProducts(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Clean Architecture',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}
