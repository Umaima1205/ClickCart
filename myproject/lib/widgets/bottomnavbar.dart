import 'package:flutter/material.dart';
import '../screens/homepage.dart';
import '../screens/fourthscreen.dart';
import '../screens/productView.dart';



void main(){

}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeTab = 0;
  Widget currentScreen = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: currentScreen,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    activeTab = 0;
                    currentScreen = const HomeView();
                  });
                },
                child: Icon(
                  Icons.home_outlined,
                  color: activeTab == 0 ?  const Color(0xff2A4BA0) : Colors.black,
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  activeTab = 1;
                  setState(() {
                    currentScreen = const ProductScreen();
                  });
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: activeTab == 1 ?  const Color(0xff2A4BA0) : Colors.black,
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  activeTab = 2;
                  setState(() {
                    currentScreen = const FourthScreen();
                  });
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: activeTab == 2 ? const Color(0xff2A4BA0) : Colors.black,
                ),
              ),
              MaterialButton(
                minWidth: 60,
                onPressed: () {
                  setState(() {
                    activeTab = 3;
                    currentScreen = const FourthScreen();
                  });
                },
                child: Icon(
                  Icons.menu,
                  color: activeTab == 3 ? const Color(0xff2A4BA0) : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}