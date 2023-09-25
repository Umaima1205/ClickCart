import 'package:flutter/material.dart';
import 'package:myproject/screens/TrackOrder.dart';
import 'package:myproject/utilities/app_colors.dart';

class ViewOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated list of user orders
    List<OrderItem> userOrders = [
      OrderItem(orderCode: 'ORD-125', orderStatus: 'Process', orderDate: '2023-08-7', imageUrl: 'https://m.media-amazon.com/images/I/91Kaln27NwL._AC_SX522_.jpg'),
      OrderItem(orderCode: 'ORD-124', orderStatus: 'Shipped', orderDate: '2023-08-30', imageUrl: 'https://m.media-amazon.com/images/I/71rkbj2sDjL.__AC_SX300_SY300_QL70_FMwebp_.jpg'),
      OrderItem(orderCode: 'ORD-123', orderStatus: 'Cancel', orderDate: '2023-08-15', imageUrl: 'https://m.media-amazon.com/images/I/61VhJEchChL._AC_UY218_.jpg'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: userOrders.map((orderItem) {
            return Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: ListTile(
                leading: Container(
                  width: 80, // Set the desired width
                  height: 400, // Set the desired height
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(orderItem.imageUrl),
                    ),
                  ),
                ),
                title: Text(
                  'Order Code: ${orderItem.orderCode}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1E222B),
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Order Date: ${orderItem.orderDate}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8891A5),
                        ),
                      ),
                    ),
                 Container(
  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0), // Adjust padding as needed
  width: 90, // Set the desired width
  height: 30, // Set the desired height
  decoration: BoxDecoration(
  color: Colors.transparent,
    borderRadius: BorderRadius.circular(18.0),
    border: Border.all(
      color: AppColors.Color_Yellow, // Set the desired border color
      width: 1.0, // Set the desired border width
    ),
  ),
  child: Center(
    child: Text(
      '${orderItem.orderStatus}',
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.Color_Yellow, // Change text color to white for better readability on colored background
      ),
    ),
  ),
)


                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Navigate to the track order page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TrackOrderPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.Color_Blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text(
                    'Track Order',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

}

class OrderItem {
  final String orderCode;
  final String orderStatus;
  final String orderDate;
  final String imageUrl;

  OrderItem({required this.orderCode, required this.orderStatus, required this.orderDate, required this.imageUrl});
}

