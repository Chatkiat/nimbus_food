import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tester/model/menu.dart';
import 'package:tester/pages/home/food_pages/food_list_page.dart';
import 'package:tester/pages/home/food_pages/order.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tester/model/menu.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add,size: 30,),backgroundColor: Colors.grey.shade800,
      ),
    //float ตรงนี้
    );
  }

  Future<void> _test() async{
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.get(url);

    if(response.statusCode == 200){
      Map<String, dynamic> jsonBody =  json.decode(response.body);//แปลงเป็น โครงสร้าง dart
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];

      print('STATUS: $status');
      print('MESSAGE: $message');

      var foodList = data.map((element) => FoodItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          image: element['image'],
      )).toList();
      print('data: $foodList');

    }
  }

}