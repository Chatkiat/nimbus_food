import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/pages/home/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String input = '';
  String pass = '123456';
  var dot = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconList = [];
    for (var j = 0; j < dot; j++) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.white,
        size: 25.0,
      ));
    }
    for (var i = 0; i < (6 - dot); i++) {
      iconList.add(Icon(
        Icons.circle_rounded,
        color: Colors.white12,
        size: 25.0,
      ));
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/black.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 100,
                          color: Colors.blueGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'LOGIN',
                            style: GoogleFonts.fredokaOne(fontSize: 30,color: Colors.red),

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            'Enter PIN to login',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [for (var item in iconList) item],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      [1, 2, 3],
                      [4, 5, 6],
                      [7, 8, 9],
                      [-2, 0, -1],
                    ].map((row) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: row.map((item) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: LoginButton(
                              number: item,
                              onClick: _handleClickbutton,
                            ),
                          );
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickbutton(int num) {
    setState(() {
      if (num == -1) {
        input = input.substring(0, input.length - 1);
        dot--;
      } else {
        input = input + '$num';
        dot++;
      }
      if (input.length == 6 && input != pass) {
        input = '';
        dot = 0;
        return _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
      }else if(input.length == 6 && input == pass){
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
        Navigator.popAndPushNamed(context, '/home');
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.fredokaOne(fontSize: 30,color: Colors.red),
          ),
          content: Text(
            msg,
            style: GoogleFonts.fredokaOne(),
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.fredokaOne(color: Colors.red,fontSize: 15),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : () => onClick(number),
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: Colors.white),
          /* boxShadow: [
            BoxShadow(
                color: Colors.yellow,
                blurRadius: 10,
                offset: Offset(5, 5),
                spreadRadius: 2)
          ],*/
        ),
        child: Center(
          child: number >= 0
              ? Text(
            number.toString(),
            style: Theme.of(context).textTheme.headline6,
          )
              : (number == -1
              ? Icon(
            Icons.backspace_outlined,
            size: 28.0,
            color: Colors.white,
          )
              : SizedBox.shrink()),
        ),
      ),
    );
  }
}