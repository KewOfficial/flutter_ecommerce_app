import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget{
  final String promotionName;
  PromotionCard({required this.promotionName});
  @override
  Widget build(BuildContext context){
    return Container(
      width: 150,
      height: 80,
      color: Colors.orange,
      child: Center(
        child: Text(
          promotionName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}