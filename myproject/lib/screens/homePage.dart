import 'package:flutter/material.dart';
import 'package:myproject/data/productdata.dart';
import '../models/Products.dart';
import 'CartPage.dart';
import 'ProductDetail.dart';
import 'package:myproject/models/checkout.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String deliveryLocation = "Gulshan-e-Iqbal, Karachi";
  String deliveryTime = "1 Day";
 List favItems = [];
 late final List<Address> addresses; 
  int selectedCategoryId = 0;
  List<Product> cartItems = [];

  List<Product> getFilteredProducts() {
    if (selectedCategoryId == 0) {
      return products;
    } else {
      return products
          .where((product) => product.CategoryId == selectedCategoryId)
          .toList();
    }
  }

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(cartItems: cartItems ),
      ),
    );
  }

  void navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }

  int getCartItemCount() {
    return cartItems.length;
  }

  @override
  Widget build(BuildContext context) {
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
              if (getCartItemCount() > 0)
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    backgroundColor:const Color(0xffFFC83A),
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
            color: const Color(
              0xff2A4BA0,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                      color: const Color(0xff153075),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Products or Store",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xff2A4BA0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Delivery To",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            deliveryLocation,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Within",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            deliveryTime,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                customContainer(
                  backgroundColor: const Color(0xffFFC83A),
                  text: "Your total Savings",
                  heading: "245 USD",
                ),
                customContainer(
                  backgroundColor: const Color(0xffE4DDCB),
                  heading: "215 Hours",
                  text: "Your time Saved",
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Our Shop",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
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
                    elevation: 4,
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
                              child: Image.network(
                                product.imageUrl,
                                fit: BoxFit.cover,
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
                //         Positioned(
                //           top: 0,
                //           right: 0,
                //           child:   IconButton(
                //   onPressed: () {
                //     setState(() {
                //       if (product.isFavourite) {
                //        product.isFavourite = false;
                //         favItems.remove(products[index]);
                //       } else {
                //         product.isFavourite = true;
                //         favItems.add(products[index]);
                //       }
                //     });
                //   },
                //   icon: Icon(
                //     Icons.favorite,
                //     color:product.isFavourite ? Colors.red : Colors.grey,
                //   ),
                // ),
                        // ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 15.0), // Adjust margin as needed
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
                                          title: const Text('Item Added to Cart'),
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
          ),
        ],
      ),
    
    );
  }

  Widget customContainer({
    required Color backgroundColor,
    required String text,
    required String heading,
  }) {
    return Container(
      width: 180,
      height: 120,
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              heading,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
