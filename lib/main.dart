import 'package:flutter/material.dart';
import 'package:tester/pages/home/food_pages/food_list_page.dart';
import 'package:tester/pages/login/login_page.dart';
import 'package:tester/pages/home/home_page.dart';
import 'package:tester/pages/home/food_pages/food_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
            headline6: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),
          )),
      //home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        '/detail':(context) => const Detail(),
        '/foodlist':(context) => const FoodListPage(),

      },
      initialRoute: '/login',
    );
  }
}
