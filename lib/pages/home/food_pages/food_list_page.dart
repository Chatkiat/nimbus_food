import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tester/model/menu.dart';

class FoodListPage extends StatefulWidget {
  static const routeName = '/foodlist';

  const FoodListPage({Key? key}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  var items = [
    FoodItem(1, "ข้าวไข่เจียว", 25, "kao_kai_jeaw.jpg"),
    FoodItem(2, "ข้าวหมูแดง", 30, "kao_moo_dang.jpg"),
    FoodItem(3, "ข้าวมันไก่", 25, "kao_mun_kai.jpg"),
    FoodItem(4, "ข้าวหน้าเป็ด", 40, "kao_na_ped.jpg"),
    FoodItem(5, "ข้าวพัด", 30, "kao_pad.jpg"),
    FoodItem(6, "ผัดซีอิ้ว", 30, "pad_sie_eew.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,

          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                goDetail(items[index]);
              },
              child: Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 0.0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // if you need this
                  side: BorderSide(
                    color: Colors.black87,
                    width: 3,
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                      child: Image.asset('assets/images/${items[index].image}',
                          width: 80.0, height: 80.0, fit: BoxFit.cover),
                  ),
                  ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Text('${items[index].name}\n${items[index].price} บาท',
                          style: GoogleFonts.fredokaOne(
                              fontSize: 30, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  void goDetail(FoodItem item) {
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: item,
    );
  }
}
