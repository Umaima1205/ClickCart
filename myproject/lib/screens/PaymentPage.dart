import 'package:flutter/material.dart';
import 'package:myproject/models/Products.dart';

import 'package:myproject/screens/OrderPage.dart';
import 'package:myproject/screens/OrderPageView.dart';
import 'package:myproject/utilities/app_colors.dart';


// ignore: must_be_immutable
class PaymentPage extends StatefulWidget {
 List<Product> cartItems=[];

   PaymentPage({ required this.cartItems});

  @override
  _PaymentPageState createState() => _PaymentPageState();

}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
double deliveryCharges = 10; 

@override
  void initState() {
    super.initState();
  }

   double getProductTotal() {
    double productTotal = 0;
    for (final product in widget.cartItems) {
      productTotal += (product.price * product.quantity);
    }
    return productTotal;
  }


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
          'Add Card',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CARD HOLDER NAME',
              style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff8891A5)), // Smaller font size
            ),
            const SizedBox(height: 8.0), // Reduced spacing
            TextFormField(
              controller: cardHolderNameController,
              style: const TextStyle(fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff1E222B)),
              decoration: const InputDecoration(
                hintText: 'Enter Card Holder Name',
                contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Smaller vertical padding
           
              ),
            ),
            const SizedBox(height: 12.0), // Reduced spacing
            const Text(
              'CARD NUMBER',
              style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff8891A5)), // Smaller font size
            ),
            const SizedBox(height: 4.0), // Reduced spacing
            TextFormField(
              controller: cardNumberController,
              style: const TextStyle(fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff1E222B)), // Smaller font size
              decoration: const InputDecoration(
                hintText: 'Enter Card Number',
                contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Smaller vertical padding
              
              ),
            ),
            const SizedBox(height: 12.0), // Reduced spacing
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'EXP DATE',
                        style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff8891A5)), // Smaller font size
                      ),
                      const SizedBox(height: 4.0), // Reduced spacing
                      TextFormField(
                        controller: expirationDateController,
                        style: const TextStyle(fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff1E222B)), // Smaller font size
                        decoration: const InputDecoration(
                          hintText: 'MM/YY',
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Smaller vertical padding
                      
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV',
                        style: TextStyle(fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff8891A5)), // Smaller font size
                      ),
                      const SizedBox(height: 4.0), // Reduced spacing
                      TextFormField(
                        controller: cvvController,
                        style: const TextStyle(fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff1E222B)), // Smaller font size
                        decoration: const InputDecoration(
                          hintText: 'CVV',
                         hoverColor: AppColors.Color_Yellow,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Smaller vertical padding
                         
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
         // Reduced spacing
            const Center(
    
            ),
          ],
        ),
      ),
             bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF8F9FB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                        OrderConfirmationPage(totalAmount: totalAmount),
                  ),
                );
              },
             
              child: const Text(
                'Place Order',
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

  @override
  void dispose() {
    // Clean up text controllers when the widget is disposed
    cardHolderNameController.dispose();
    cardNumberController.dispose();
    expirationDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }
}
