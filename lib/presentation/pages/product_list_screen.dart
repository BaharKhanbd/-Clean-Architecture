import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: productProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : productProvider.errorMessage != null
              ? Center(child: Text(productProvider.errorMessage!))
              : ListView.builder(
                  itemCount: productProvider.products.length,
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    return ListTile(
                      leading:
                          Image.network(product.image, width: 50, height: 50),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price.toString()}"),
                    );
                  },
                ),
    );
  }
}
