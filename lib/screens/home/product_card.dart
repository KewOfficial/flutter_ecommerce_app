import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String productName;
  ProductCard({required this.productName});
  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: 150,
      color: Colors.blue,
      child: Center(
        child: Text(
          productName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}