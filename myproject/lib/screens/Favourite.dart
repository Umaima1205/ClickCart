import 'package:flutter/material.dart';
import 'package:myproject/models/Products.dart';
import 'package:myproject/screens/CartPage.dart';
import 'package:myproject/screens/ProductDetail.dart';
import 'package:myproject/utilities/app_colors.dart';

class FavoritesPage extends StatefulWidget {
  final List<Product> favItems;

  FavoritesPage({Key? key, required this.favItems}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems),
      ),
    );
  }

  int getCartItemCount() {
    return cartItems.length;
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
       backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
      title: const Text(
        'My Wishlist',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      toolbarHeight: 70,
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 25.0,
                color: Colors.black,
              ),
              onPressed: navigateToCartPage,
            ),
            if (getCartItemCount() > 0)
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: AppColors.Color_Yellow,
                  radius: 8,
                  child: Text(
                    getCartItemCount().toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    ),
    body: GridView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: widget.favItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5/ 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
      ),
      itemBuilder: (ctx, index) {
        final product = widget.favItems[index];
        return GestureDetector(
          onTap: () {
            navigateToFavouriteProductDetail(product);
          },
          child: Card(
            color: const Color(0xffF8F9FB),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 12, left: 8),
                      height: 130,
                      width: 160,
                      child: Expanded(
                        child: Image.network(
                          product.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                      child: Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0),
                      child: SizedBox(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            addToCart(product);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                      'Item Added to Cart'),
                                  content: const Text(
                                      'The item has been added to your cart.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(
                                          color: Color(0xff2A4BA0),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2A4BA0),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

  // Function to navigate to the product detail page
  void navigateToFavouriteProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }
}

