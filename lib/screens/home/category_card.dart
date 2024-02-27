import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{
  final String categoryName;
  CategoryCard({required this.categoryName});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product-listings');
      },
      child:  Container(
      width: 100,
      height: 100,
      color: Colors.green,
      child: Center(
        child: Text(
          categoryName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    )
    );
  }
}