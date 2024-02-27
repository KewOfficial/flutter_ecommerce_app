import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Added to Cart'),
              backgroundColor: Colors.green,
              ),
              );
          },
          style: ElevatedButton.styleFrom(
            shadowColor:Colors.green,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16)
          ),
          child: const Text('Add to Cart',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}