import 'package:flutter/material.dart';
import 'models/Products.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  final bool isInCart;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleFavorite; // Add the onToggleFavorite callback

  ProductGridItem(
    this.product, {
    required this.isInCart,
    required this.onAddToCart,
    required this.onToggleFavorite, // Include the onToggleFavorite callback
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          '\$${product.price.toStringAsFixed(2)}',
          textAlign: TextAlign.center,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isInCart ? Icons.shopping_cart : Icons.add_shopping_cart,
                color: Colors.white,
              ),
              onPressed: onAddToCart,
            ),
            IconButton(
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: onToggleFavorite, // Call the onToggleFavorite callback
            ),
          ],
        ),
      ),
    );
  }
}
