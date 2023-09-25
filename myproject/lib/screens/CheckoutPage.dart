import 'package:flutter/material.dart';
import 'package:myproject/screens/PaymentPage.dart';
import 'package:myproject/models/Products.dart';
import 'package:myproject/utilities/app_colors.dart';

class CheckoutPage extends StatefulWidget {
  final List<Product> cartItems;

  CheckoutPage({required this.cartItems});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String selectedAddress = '';
  List<Map<String, String>> addresses = [
    {'label': 'Home', 'address': 'Gulshan-E-Iqbal#06 Karachi'},
    {'label': 'Office', 'address': 'Shahrah-E-Faisal Karachi'},
  ];

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
          'Shopping Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 90,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  final addressInfo = addresses[index];
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedAddress = addressInfo['address']!;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedAddress == addressInfo['address']
                                ? AppColors.Color_Yellow
                                : const Color(0xffF8F9FB),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${addressInfo['label']}:',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1E222B),
                              ),
                            ),
                            Text(
                              '${addressInfo['address']}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            if (selectedAddress == addressInfo['address'])
                              const Icon(
                                Icons.check_circle,
                                color: AppColors.Color_Yellow,
                                size: 24.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedAddress.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Please select a shipping address.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'OK',
                                  style: TextStyle(color: AppColors.Color_Blue),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaymentPage(cartItems: []),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xff2A4BA0),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              
                  ),
              
                    child: const Text(
                      'Proceed To Payment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
