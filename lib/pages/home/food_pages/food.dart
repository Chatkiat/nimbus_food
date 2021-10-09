import 'package:flutter/material.dart';
import 'package:tester/pages/home/food_pages/food_list_page.dart';
import 'package:tester/pages/home/food_pages/order.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  static const routeName = '/food';

  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedBottomNavIndex == 0 ? FoodListPage() : OrderPage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedLabelStyle:GoogleFonts.fredokaOne(fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(

            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your order',

          ),
        ],
        currentIndex: _selectedBottomNavIndex,fixedColor: Colors.yellowAccent.shade700,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: GoogleFonts.fredokaOne(),
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;

          });
        },
      ),
    );
  }
}