import 'package:flutter/material.dart';
import 'package:myproject/models/Products.dart';


class ProductGridItem extends StatefulWidget {
  final Product product;
  final bool isInCart;
  final VoidCallback onAddToCart;

  ProductGridItem({
    required this.product,
    required this.isInCart,
    required this.onAddToCart,
  });

  @override
  _ProductGridItemState createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
 List  favItems=[];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GridTile(
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(0.0)),
          child: Image.network(
            widget.product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(
            widget.product.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            '\$${widget.product.price.toStringAsFixed(2)}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  widget.isInCart
                      ? Icons.shopping_cart
                      : Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: widget.onAddToCart,
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
