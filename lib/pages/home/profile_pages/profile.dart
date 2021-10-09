import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Container(
                  width: 170.0,
                  height: 170.0,
                  child: Image.asset('assets/images/cat2.jpg'),
                )
            ),
            SizedBox(height: 8.0,),
            Text(
              'Chatkiat Sriphuttha',
              style: GoogleFonts.fredokaOne(fontSize: 35.0,color: Colors.blueGrey.shade300,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0,),
            Text(
              'mrchatkiat409@gmail.com',
              style: GoogleFonts.fredokaOne(fontSize: 20.0,color: Colors.blueGrey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
