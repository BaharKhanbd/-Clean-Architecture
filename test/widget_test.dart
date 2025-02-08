import 'package:clean_project/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_project/main.dart';
import 'package:clean_project/data/data_sources/product_remote_data_source.dart';

import 'package:clean_project/domain/use_cases/get_products.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // প্রয়োজনীয় ডিপেনডেন্সি ইনিশিয়ালাইজ করা হলো
    final productRepository = ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSource(),
    );
    final getProductsUseCase = GetProducts(repository: productRepository);

    // `MyApp` এ `getProductsUseCase` পাস করা হলো
    await tester.pumpWidget(MyApp(getProductsUseCase: getProductsUseCase));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
