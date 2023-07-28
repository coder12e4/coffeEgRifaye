import 'package:coffie_delivary/model/catogarymodel.dart';
import 'package:flutter/material.dart';
import 'product.dart'; // Import the product data and model from the previous step

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<String> categories = ['Category A', 'Category B', 'Category C'];
  String selectedCategory = 'Category A';
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () => _updateSelectedCategory(categories[index]),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) {
                        if (categories[index] == selectedCategory) {
                          return Colors
                              .blue; // Change button color for selected category
                        } else {
                          return Colors.grey;
                        }
                      },
                    ),
                  ),
                  child: Text(categories[index]),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];

                if (selectedCategory == 'Category A') {
                  return ListTile(
                    title: Text(product.name),
                  );
                } else if (product.category == selectedCategory) {
                  return ListTile(
                    title: Text(product.name),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ), 
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToSelectedCategory,
        child: Icon(Icons.arrow_upward),
      ),
    );
  }

  // Function to update the selected category and trigger a UI update
  void _updateSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Function to scroll to the selected category
  void _scrollToSelectedCategory() {
    final index = categories.indexOf(selectedCategory);
    if (index >= 0) {
      final itemScrollOffset =
          index * 64.0; // Assuming each category button height is 60
      _scrollController.animateTo(itemScrollOffset,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }
}
