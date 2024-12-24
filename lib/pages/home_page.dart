import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_store_app/model/cart_model.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CartPage();
        },
        )),
        backgroundColor: Colors.white,
        child: const Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 48),
        
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Hey there,'),
            ),

            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Let's order fresh items for you!",
                style:GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            const SizedBox(height: 24),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text('Item List',
              style: TextStyle(fontSize: 16),
              ),
            ),

            Expanded(
              child: Consumer<CartModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.shopItems.length,
                    padding: const EdgeInsets.all(12),
                gridDelegate: 
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                  ), 
                itemBuilder: (context, index) { 
                return GroceryItemTile(
                  itemName: value.shopItems[index][0],
                  itemPrice: value.shopItems[index][1],
                  imagePath: value.shopItems[index][2],
                  color: value.shopItems[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                      .addItemToCart(index);
                  } ,
                );
               },
               );
                }
              )
               )
          ],
        ),
      ),
    );
  }
}