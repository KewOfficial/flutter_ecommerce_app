import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductListings extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
  title: const Text('Product Listing'),
  backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder:(context, index){
return Card(
  elevation:5.0 ,
  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  child: ListTile(
    contentPadding:const EdgeInsets.all(12),
    leading: Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
       image:const DecorationImage(
         image: NetworkImage(
          'https://placekitten.com/80/80',
         ),
         fit: BoxFit.cover
       )

      ),
    ),
    title: Text(
      'Product Name $index',
      style: const TextStyle(
        fontWeight: FontWeight.bold
      ),
    ),
    subtitle:Text(
      'Product Descriping(adding it soon)',
      style: TextStyle(
        color: Colors.grey[600],
      ),
    ),
    trailing:const Text(
      '\$20.99',
      style: TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, '/product-details/$index');
    },
  ),
);
        }
        ),
    );
  }
}