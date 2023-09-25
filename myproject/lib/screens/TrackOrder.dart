import 'package:flutter/material.dart';
import 'package:myproject/utilities/app_colors.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({Key? key}) : super(key: key);

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
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
          'Track Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assests/images/5.jpg'), // Correct the asset path
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            const SizedBox(height: 20),
           Row(
  children: [
    Container(
     margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
    
    
   
        borderRadius: BorderRadius.circular(10.0), // Border radius for the row
      ),
      padding: const EdgeInsets.all(15),
      child: CircleAvatar(
        radius: 20, // Set the desired radius for the avatar
        backgroundColor: Colors.white, // Background color for the avatar
        child: Image.asset(
          'assests/images/profile.png', // Replace with the path to your delivery person image
          width: 50, // Set the desired width for the image
          height: 50, // Set the desired height for the image
        ),
      ),
    ),
    const SizedBox(width: 10),
    const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Man:', // Replace with the actual name
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff616A7D),
          ),
        ),
        Text(
          'On the way', // Replace with the subtext
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff1E222B),
          ),
        ),
      ],
    ),
    const Spacer(),
    Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.Color_Blue, // Change the background color as needed
      ),
      padding: const EdgeInsets.all(8), // Adjust the padding as needed
      child: const Icon(
        Icons.chat_bubble_rounded, // Replace with the desired icon
        size: 20,
        color: Colors.white, // Change the icon color as needed
      ),
    ),
  ],
),ClipRRect(
  borderRadius: BorderRadius.circular(15.0), // Set the desired border radius
  child: Container(
     color: const Color(0xffF8F9FB),// Set the desired background color
    padding: const EdgeInsets.all(16.0), // Add padding to the section
    child: const Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Order Code:', // Replace with the actual order code
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Order Status:', // Replace with the actual order code
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    'Order Date:', // Replace with the actual order code
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'ORD-124', // Replace with the actual order code
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff616A7D),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Shipped', // Replace with the actual order date
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff616A7D),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '2023-08-30', // Replace with the actual order code
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff616A7D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 40),
        // Add any other content or widgets as needed
      ],
    ),
  ),
)
],
        ),

      ),
    );
  }
}
