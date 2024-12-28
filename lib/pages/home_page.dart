import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart_model.dart';
import '../components/grocery_item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          title: const Text(
            'Grocery Store',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search items...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          final filteredItems = cart.shopItems.where((item) {
            final itemCategory = item.category.trim().toLowerCase();
            final selectedCategory = _selectedCategory.trim().toLowerCase();
            final matchesCategory =
                selectedCategory == 'all' || itemCategory == selectedCategory;
            final matchesSearchQuery = _searchQuery.isEmpty ||
                item.name.toLowerCase().contains(_searchQuery.toLowerCase());
            return matchesCategory && matchesSearchQuery;
          }).toList();

          cart.shopItems.forEach((item) {
            print('Item: ${item.name}, Category: "${item.category}"');
          });
          print('Selected Category: $_selectedCategory');
          print(
              'Filtered Items: ${filteredItems.map((item) => item.name).toList()}');

          return Column(
            children: [
              // Category Chips
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('All', _selectedCategory == 'All'),
                    _buildCategoryChip('Fruits', _selectedCategory == 'Fruits'),
                    _buildCategoryChip(
                        'Vegetables', _selectedCategory == 'Vegetables'),
                    _buildCategoryChip('Dairy', _selectedCategory == 'Dairy'),
                    _buildCategoryChip('Meat', _selectedCategory == 'Meat'),
                    _buildCategoryChip(
                        'Desserts', _selectedCategory == 'Desserts'),
                  ],
                ),
              ),

              // Items Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return GroceryItemTile(
                      itemName: item.name,
                      itemPrice: item.price.toStringAsFixed(2),
                      imagePath: item.imagePath,
                      color: _getColor(item.color),
                      onPressed: () {
                        final originalIndex =
                            cart.shopItems.indexOf(item); // Find original index
                        if (originalIndex != -1) {
                          cart.addItemToCart(originalIndex);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Helper function for building category chips
  Widget _buildCategoryChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Chip(
          label: Text(label),
          backgroundColor: isSelected ? Colors.green : Colors.grey[300],
          elevation: isSelected ? 4 : 0,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Helper function for color conversion
  Color _getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'purple':
        return Colors.purple;
      case 'orange':
        return Colors.orange;
      case 'brown':
        return Colors.brown;
      case 'lightgreen':
        return Colors.lightGreen;
      case 'lightblue':
        return Colors.lightBlue;
      case 'amber':
        return Colors.amber;
      case 'pink':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
