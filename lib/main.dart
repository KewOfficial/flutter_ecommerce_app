
import 'package:flutter/material.dart';
import 'package:online_shop/screens/product/product_details.dart';
import 'package:online_shop/screens/product/product_listings.dart';
import 'screens/onboarding/sign_up_login.dart';
import 'screens/home/category_card.dart';
import 'screens/home/product_card.dart';
import 'screens/home/promotion_card.dart';
import 'screens/home/section_title.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpLoginScreen(), 
      routes: {
        '/home': (context) => HomeScreen(),
         '/category': (context) => CategoryCard(categoryName: 'Clothes'),
         '/product': (context) => ProductCard(productName: 'Product 1',), 
           '/promotion': (context) => PromotionCard(promotionName: 'Discount',), 
             '/search': (context) => const SearchBar(),
               '/section': (context) => SectionTitle(title: 'Featured Products'),
                '/product-listings': (context) => ProductListings(),
                 '/product-details': (context) => ProductDetails(productId:0 ),

      
      },
    );
  }
}
