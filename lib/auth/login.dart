import 'dart:convert';

import 'package:first_task_api/main.dart';
import 'package:http/http.dart'as http;
import 'package:first_task_api/custom%20items.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Categories.dart';


class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = false;
  TextEditingController? phoneFieldController = TextEditingController();
  TextEditingController? passwordFieldController = TextEditingController();
  String? variable;
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              AppBackGround(),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.30),
                child: CustomedContainer(
                 0,
                 100,
                  0.76,

                  ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08,
                            left: MediaQuery.of(context).size.width * 0.12),
                        child: const Text(
                          "Welcome back",
                          style: TextStyle(
                              color:  Color.fromRGBO(192, 53, 97, 0.9),
                              fontSize: 37,
                              fontFamily: "title"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.27),
                        child: Text(
                          "Login to Shopping Now",
                          style: TextStyle(
                              color: Colors.black87.withOpacity(0.47),
                              fontSize: 13,
                              fontFamily: "alef",
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.055,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
                        child: FormFields(
                            "Phone",
                            const Icon(Icons.phone_android_rounded),
                            null,
                            false,
                            phoneFieldController!),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.05,
                            left: MediaQuery.of(context).size.width * 0.07,
                            right: MediaQuery.of(context).size.width * 0.07),
                        child: FormFields(
                            "Password",
                            const Icon(Icons.lock),
                            IconButton(
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSecure = !isSecure;
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                            isSecure,
                            passwordFieldController!),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.width * 0.14,
                            horizontal:
                            MediaQuery.of(context).size.width * 0.15),
                        child: CustomBtn(
                            "LOG IN",
                            const  Color.fromRGBO(192, 53, 97, 0.9),
                            Colors.white, () async {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            String x = passwordFieldController!.text;
                            String y = phoneFieldController!.text;

                            dynamic response = await http.get(Uri.parse(
                                "http://rms4design.com/flutter/login.php?phone=${y}&password=${x}"));
                            print(response.statusCode);
                            if (response.statusCode == 200) {
                              String result = response.body;
                              print(result);
                              if (result == "Login Success") {
                                dynamic xx =await http.get(Uri.parse("https://rms4design.com/flutter/profile.php?phone=${y}&password=${x}"));
                                dynamic prof = jsonDecode(utf8.decode(xx.bodyBytes)) as Map;
                                saveddata =await SharedPreferences.getInstance();
                                saveddata.setString('phone', prof["phone"]);
                                saveddata.setString('name', prof["name"]);
                                saveddata.setString('password', prof["password"]);
                                print(saveddata.getString('name'));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Category()));
                              } else {
                                MotionToast.error(
                                    title:  Text("Error"),
                                    description:  Text("Something is Wrong!!")
                                ).show(context);

                              }
                            } else {
                              MotionToast.error(
                                  title:  Text("Error"),
                                  description:  Text("Something is Wrong!!")
                              ).show(context);

                            }
                          }
                        }, 42, 0.75, 19),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
