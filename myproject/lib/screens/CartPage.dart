import 'package:flutter/material.dart';
import 'package:myproject/models/Products.dart';
import 'package:myproject/screens/CheckoutPage.dart';
import 'package:myproject/utilities/app_colors.dart';

class CartPage extends StatefulWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double deliveryCharges = 10;

  @override
  Widget build(BuildContext context) {
    double productTotal = getProductTotal();
    double totalAmount = productTotal + deliveryCharges;

    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
        title: const Text(
          'Shopping Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final product = widget.cartItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.network(
                    product.imageUrl,
                    width: 80, // Adjust image size here
                    height: 80, // Adjust image size here
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Quantity:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: AppColors.Color_Blue,
                                ),
                                onPressed: () {
                                  if (product.quantity > 1) {
                                    setState(() {
                                      product.quantity--;
                                    });
                                  }
                                  updateTotalAmount();
                                },
                              ),
                              Text(
                                '${product.quantity}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: AppColors.Color_Blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    product.quantity++;
                                  });
                                  updateTotalAmount();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Color.fromARGB(255, 201, 24, 12),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Remove Item'),
                            content: const Text(
                                'Are you sure you want to remove this item from your cart?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel',
                                    style: TextStyle(
                                      color: AppColors.Color_Blue,
                                    )),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    widget.cartItems.remove(product);
                                  });
                                  updateTotalAmount();
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(
                                    color: AppColors.Color_Blue,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const Divider(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF8F9FB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff616A7D)
                  ),
                ),
                Text(
                  '\$${productTotal.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff1E222B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Delivery',
                  style: TextStyle(
                   fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff616A7D)
                  ),
                ),
                Text(
                  '\$${deliveryCharges.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff1E222B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                  fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff616A7D)
                  ),
                ),
                Text(
                  '\$${totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                   fontSize: 14,
                    color: Color(0xff1E222B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CheckoutPage(cartItems: widget.cartItems),
                  ),
                );
              },
             
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff2A4BA0),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getProductTotal() {
    double productTotal = 0;
    for (final product in widget.cartItems) {
      productTotal += (product.price * product.quantity);
    }
    return productTotal;
  }

  void updateTotalAmount() {
    setState(() {});
  }
}
