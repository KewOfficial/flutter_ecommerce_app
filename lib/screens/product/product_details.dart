import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final int productId;
  ProductDetails({required this.productId});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name $productId',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
           const SizedBox(height: 16,),
           Text('Description: great Product to buy',
           style: TextStyle(
            fontSize: 16, 
            color: Colors.grey[600]
           ),
           ),
           const SizedBox(height: 20,),
           const Text('\$20.99',
           style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green
           ),
           ),
           
          ],
        ),
        ),
    );
  }
}