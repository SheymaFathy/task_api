import 'package:first_task_api/custom%20items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'auth/signup.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: AppBackGround(),
        ),
        ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.24, left: 30),
              child: Text(
                "Enjoy your shopping With us...",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "fred",
                  fontSize: 50,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 200),
                child: CustomBtn(
                    "SIGN UP",
                    Color.fromRGBO(192, 53, 97, 0.9),
                    Colors.white,
                    () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                    42, 0.75, 19),
              ),
            ),
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 25, bottom: 40),
              child: CustomBtn("LOG IN", Colors.white.withOpacity(0.9),
                  Color.fromRGBO(12, 13, 101, 0.85), () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LogIn()));
              }, 42, 0.75, 19),
            )),
          ],
        )
      ]),
    );
  }
}
