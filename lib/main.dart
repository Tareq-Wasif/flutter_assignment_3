

import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // List of products
  List<Product> products = [

    Product(name: 'Product ', price: 100.01, count: 0),
    Product(name: 'Product ', price: 200.10, count: 0),
    Product(name: 'Product ', price: 300.20, count: 0),
    Product(name: 'Product ', price: 100.30, count: 0),
    Product(name: 'Product ', price: 200.50, count: 0),
    Product(name: 'Product ', price: 300.60, count: 0),
    Product(name: 'Product ', price: 100.70, count: 0),
    Product(name: 'Product ', price: 200.09, count: 0),
    Product(name: 'Product ', price: 300.01, count: 0),
    Product(name: 'Product ', price: 100.04, count: 0),
    Product(name: 'Product ', price: 200.07, count: 0),
    Product(name: 'Product ', price: 300.01, count: 0),
    Product(name: 'Product ', price: 100.02, count: 0),
    Product(name: 'Product ', price: 200.08, count: 0),
    Product(name: 'Product ', price: 300.05, count: 0),
    Product(name: 'Product ', price: 100.02, count: 0),
    Product(name: 'Product ', price: 200.90, count: 0),
    Product(name: 'Product ', price: 300.70, count: 0),
    Product(name: 'Product ', price: 100.30, count: 0),
    Product(name: 'Product ', price: 200.70, count: 0),
    Product(name: 'Product ', price: 300.04, count: 0),
    Product(name: 'Product ', price: 100.02, count: 0),
    Product(name: 'Product ', price: 200.05, count: 0),
    Product(name: 'Product ', price: 300.07, count: 0),
  ];

  // Total number of products bought (moved to the state class)
  int totalProductsBought = 0;

  // Show a dialog box when the counter for a product reaches 5
  void showCongratulationsDialog(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You\'ve bought 5 ${product.name}!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          Product product = products[index];

          return ListTile(
            // title: Text(product.name),
            title: Text(' ${product.name} ${index + 1}'),
            subtitle: Text('\$${product.price}'),
            trailing: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('count  ${product.count}'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      product.count++;
                      totalProductsBought++; // Increment the total count
                      if (product.count == 5) {
                        showCongratulationsDialog(product);
                      }
                    });
                  },
                  child: Text("Buy Now"),
                ),
              ],
            ),
          );
          },
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the CartPage and pass the totalProductsBought
          Navigator.pushNamed(context, '/cart', arguments: totalProductsBought);
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}



class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the totalProductsBought from arguments
    final int totalProductsBought = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total product: $totalProductsBought'),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List with Counter and Dialog',
      initialRoute: '/',
      routes: {
        '/': (context) => ProductList(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class Product {
  String name;
  double price;
  int count;

  Product({required this.name, required this.price, required this.count});
}










