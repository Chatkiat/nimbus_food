import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester/pages/home/profile_pages/profile.dart';
import 'package:tester/pages/home/food_pages/food.dart';
import 'package:tester/pages/home/food_pages/food_list_page.dart';
class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;
  var _selectedDrawerItemIndex = 0;
  final _pageDataList = [
    {
      'icon': Icons.fastfood,
      'title': 'Food',
      'page': FoodPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Profile',
      'page': ProfilePage(),
    },


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Text(_subPageIndex == 0 ? 'FLUTTER FOOD' : 'Profile',
            style: GoogleFonts.fredokaOne(color: Colors.white)),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/cat2.jpg'),
                      )),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Chatkiart Sriphuttha',
                    style: GoogleFonts.fredokaOne(
                        fontSize: 22.0, color: Colors.white),
                  ),
                  Text(
                    'mrchatkiat409@gmail.com',
                    style: TextStyle(fontSize: 15.0, color: Colors.white70),
                  ),
                ],
              ),
            ),
            for (var item in _pageDataList)
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      color: item == _pageDataList[_selectedDrawerItemIndex]
                          ? Colors.lightGreenAccent
                          : null,
                    ),
                    SizedBox(width: 8.0),
                    Text(item['title'] as String,style: GoogleFonts.fredokaOne(color: item == _pageDataList[_selectedDrawerItemIndex]
                        ? Colors.deepPurple
                        :null),),
                  ],
                ),

                onTap: () {
                  setState(() {
                    _selectedDrawerItemIndex =
                        _pageDataList.indexWhere((element) => item == element);
                  });
                  Navigator.of(context).pop();
                },
                selected: item == _pageDataList[_selectedDrawerItemIndex],
              ),
          ],
        ),
      ),
      body: _pageDataList[_selectedDrawerItemIndex]['page'] as Widget,
    );
  }

}
