import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/screens/home/category_card.dart';
import 'package:online_shop/screens/product/product_details.dart';
import 'section_title.dart';



class HomeScreen extends StatelessWidget{
  Future<List<String>> fetchUnSplashImages()async{
    final response= await http.get(
Uri.parse('https://api.unsplash.com/photos/random?count=5'),
 headers: {
  'Authorization': 'Client-ID 9o9sSA5LL9cBGwbxXNTWqi9ZOxWprzgLrRfzuXAfwBo',
 }
    );
    if(response.statusCode==200){
      List<dynamic>data = json.decode(response.body);
      return data.map<String>((item) => item['urls']['regular']as String).toList();
    }
    else{
      throw Exception('Failed to load images');
    }
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Shop'),
        backgroundColor: Colors.orange,
        actions:  [
          const Expanded(
            child: Padding
            (padding:EdgeInsets.all(8.0),
            child: SearchBar(),
            ),
            ),
           IconButton(icon: const Icon(Icons.account_circle),
           onPressed: () {
             Navigator.pushNamed(context, '/profile');
           },
           )
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: fetchUnSplashImages(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState ==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if (snapshot.hasError){
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          else if(!snapshot.hasData||snapshot.data==null || snapshot.data!.isEmpty){
            return const Center(
              child: Text('No images available'),
            );
          }
          else{
           
            return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
            Padding(
              padding:const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionTitle(title: 'Categories'),
                  SizedBox(
                    height: 200,
                    child: GridView.builder
                    (gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                    (crossAxisCount: 2, 
                    crossAxisSpacing: 8.0,
                     mainAxisSpacing: 8.0),
                     itemCount: 8,
                      itemBuilder: (context, index){
                        return CategoryCard(categoryName: 'Category $index');
                      },
                      physics: const AlwaysScrollableScrollPhysics(),
                      ),
                  ),
                  SectionTitle(title: 'Weekly Featured Products'),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                       itemCount:snapshot.data!.length,
                      itemBuilder: (context, index){
                       return GestureDetector(
                        onTap: () {
                          Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context)=>ProductDetails(productId: index),
                       )
                          );
                        },
                        child: Image.network(snapshot.data![index],
                        fit: BoxFit.cover,
                        )
                       );
                      },
                      physics: const AlwaysScrollableScrollPhysics(),
                      ),
                     
                  ),
                  const SizedBox(height: 20,),
                  SectionTitle(title: 'Promotions'),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Image.network(snapshot.data![index]);
                      },
                      physics:const AlwaysScrollableScrollPhysics()
                      ),
                      ),
          CarouselSlider(items: snapshot.data!
          .map((imageUrl) => Image.network(imageUrl, fit: BoxFit.cover)). toList()
          , options: CarouselOptions(
            height: 200,
          ))
                ],
              ),
              )
        ],
      );
          }
        }
        ),
      
      ),
        bottomNavigationBar: BottomNavigationBar(
          items:const [BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list),
          label: 'Categories'
          
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
          label: 'Cart'
          )
          ],
          onTap: (int index){

          },
        ),
floatingActionButton: FloatingActionButton(onPressed:()
{
ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Added to cart')));
},
child: const Icon(Icons.add),
 ),
    );
  }
}