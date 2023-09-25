import 'package:flutter/material.dart';
import 'package:myproject/data/productdata.dart';
import 'package:myproject/models/Products.dart';
import 'package:myproject/screens/CartPage.dart';
import 'package:myproject/screens/CategoryList.dart';
import 'package:myproject/screens/ProductDetail.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedCategoryId = 0;
  List<Product> cartItems = []; // Create a list to store cart items

  List<Product> getFilteredProducts() {
    if (selectedCategoryId == 0) {
      return products;
    } else {
      return products
          .where((product) => product.CategoryId == selectedCategoryId)
          .toList();
    }
  }

  // Function to add a product to the cart
  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  // Function to navigate to the cart page
  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems ),
      ),
    );
  }


  // Function to navigate to the product detail page
  void navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  // Function to get the count of items in the cart
  int getCartItemCount() {
    return cartItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
         backgroundColor: Colors.white,
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
                  IconButton(
              onPressed: (){},
            icon: const Icon(Icons.search_rounded,
            size: 25,
            color: Colors.white,),
          ),
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
                if (getCartItemCount() >
                    0) // Show badge only if cart is not empty
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
        body: Column(
          children: [
            Container(
              color: const Color(0xff2A4BA0),
              padding: const EdgeInsets.all(12.0),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shop",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontFamily:'Manrope',
                        
                      ),
                    ),
                    Text(
                      "By Category",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1,
                        fontFamily: 'Manrope',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CategoryList(
              categories: ListOfCategory,
              onCategorySelected: (categoryId) {
                setState(() {
                  selectedCategoryId = categoryId;
                });
              },
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15.0),
                itemCount: getFilteredProducts().length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5 / 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                itemBuilder: (ctx, index) {
                  final product = getFilteredProducts()[index];
                  return GestureDetector(
                    onTap: () {
                      navigateToProductDetail(product);
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
                                padding: const EdgeInsets.only(top: 5.0, bottom: 1.0 ),
                                child: Text(
                                  textAlign:TextAlign.left,
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
                                  textAlign:TextAlign.left,
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
                      //  Positioned(
                      //          top: 0,
                      //       right: 0,
                      //       child: IconButton(
                      //         icon: Icon(
                      //           product.isFavourite
                      //               ? Icons.favorite
                      //               : Icons.favorite_border,
                      //           color: product.isFavourite
                      //               ? Colors.red
                      //               : Colors.red,
                      //         ),
                      //         onPressed: () {},
                      //       ),
                      //      ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0), // Adjust margin as needed
                                child: SizedBox(
                                  height: 30, // Set the desired height
                                  width: 120, // Set the desired width
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
                                      setState(
                                          () {}); // Update the UI to reflect cart changes
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff2A4BA0),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
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
            ),
          ],
        ),
      ),
    );
  }
}
