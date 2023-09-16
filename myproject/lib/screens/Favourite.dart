import 'package:flutter/material.dart';
 

// ignore: must_be_immutable
class FavoritesPage extends StatefulWidget {
  // final List<Product> favItems;
 List favItems = [];
  FavoritesPage({super.key, required this.favItems});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: ListView.builder(
        itemCount: widget.favItems.length,
        itemBuilder: (context, index) {
          // Create a custom widget to display product information
          return ListTile(
            leading: Image.network(widget.favItems[index].imageUrl),
            title: Text(widget.favItems[index].title),
            subtitle: Text('\$${widget.favItems[index].price.toStringAsFixed(2)}'),
            // Add more product details here
          );
        },
      ),
    );
  }
}
