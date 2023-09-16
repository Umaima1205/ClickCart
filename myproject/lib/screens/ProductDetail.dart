import 'package:flutter/material.dart';
import 'package:myproject/models/Products.dart';
import 'package:myproject/screens/Favourite.dart';
import 'CartPage.dart';
import 'package:myproject/data/productdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool showFullDescription = false;
  List<Product> favItems = [];
  List<Product> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoriteProducts = prefs.getStringList('favorites') ?? [];
    setState(() {
      favItems = favoriteProducts
          .map((productId) =>
              products.firstWhere((product) => product.id == productId))
          .toList();
    });
  }

  Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoriteIds = favItems.map((product) => product.id).toList();
    await prefs.setStringList('favorites', favoriteIds.cast<String>());
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    String descriptionToShow = widget.product.description;

    if (!showFullDescription && widget.product.description.length > 100) {
      descriptionToShow = widget.product.description.substring(0, 100);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff2A4BA0),
        title: const Text(
          "Hey, User",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 80,
        elevation: 0,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 25.0,
                  color: Colors.white,
                ),
                onPressed: navigateToCartPage,
              ),
              if (getCartItemCount() > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor: const Color(0xffFFC83A),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adjust the image size here
            Image.network(
              widget.product.imageUrl,
              fit: BoxFit.cover,
              height: 300, // Adjust the height
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8), // Add spacing
                          IconButton(
                            onPressed: () {
                              toggleFavorite();
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite()
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8), // Add spacing
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: Text(
                          'Your Text',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Row for rating and text box with border radius
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          for (int i = 0; i < 5; i++)
                            Icon(
                              Icons.star,
                              color: i < 4 ? Colors.yellow : Colors.grey,
                              size: 24,
                            ),
                          const SizedBox(width: 8), // Add spacing
                          Text(
                            '4.5',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    descriptionToShow,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  widget.product.description.length > 100
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              showFullDescription = !showFullDescription;
                            });
                          },
                          child: Text(
                            showFullDescription ? "See Less" : "See More",
                            style: const TextStyle(
                              color: Color(0xff2A4BA0),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: TextButton(
                onPressed: () {
                  addToCart(widget.product);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Item Added to Cart'),
                        content:
                            const Text('The item has been added to your cart.'),
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
                },
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritesPage(favItems: favItems),
                    ),
                  );
                },
                child: const Text(
                  "View WishList",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleFavorite() {
    setState(() {
      if (isFavorite()) {
        favItems.remove(widget.product);
      } else {
        favItems.add(widget.product);
      }
      saveFavorites();
    });
  }

  bool isFavorite() {
    return favItems.contains(widget.product);
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems ) ,
      ),
    );
  }

  int getCartItemCount() {
    return cartItems.length;
  }
}

