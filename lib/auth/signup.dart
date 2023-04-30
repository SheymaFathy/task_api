import 'package:http/http.dart' as http;
import 'package:first_task_api/custom%20items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();
  bool passwordVisible = false;
  bool Issecure = true;
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
                    top: MediaQuery.of(context).size.height * 0.22),
                child: CustomedContainer(
                    200,
                    0,
                    0.80,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.08,
                                ),
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromRGBO(13, 6, 88, 0.8),
                                      fontSize: 37,
                                      fontFamily: "title"),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Create yor own account now",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.47),
                                    fontSize: 13,
                                    fontFamily: "alef",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.035,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields("Name", Icon(Icons.person),
                                  null, false, nameFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "Phone",
                                  Icon(Icons.phone_android_rounded),
                                  null,
                                  false,
                                  phoneFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.03,
                                  left:
                                      MediaQuery.of(context).size.width * 0.07,
                                  right:
                                      MediaQuery.of(context).size.width * 0.07),
                              child: FormFields(
                                  "Password",
                                  Icon(Icons.lock),
                                  IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        Issecure = !Issecure;
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  Issecure,
                                  passwordFieldController),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width * 0.1,
                                  left:
                                      MediaQuery.of(context).size.width * 0.15,
                                  right:
                                      MediaQuery.of(context).size.width * 0.15,
                                  bottom: MediaQuery.of(context).size.width *
                                      0.001),
                              child: CustomBtn(
                                  "SIGN UP",
                                  const Color.fromRGBO(13, 6, 88, 0.8),
                                  Colors.white, () async {
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  String x = passwordFieldController.text;
                                  String y = phoneFieldController.text;
                                  String f = nameFieldController.text;
                                  dynamic z = await http.get(Uri.parse(
                                      "http://rms4design.com/flutter/signup.php?phone=${y}&password=${x}&name=${f}"));
                                  if (z.statusCode == 200) {
                                    String a = z.body;
                                    if (a == "Signup Success") {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => LogIn()));
                                    } else {
                                      MotionToast.error(
                                              title: Text("Error"),
                                              description:
                                                  Text("Something is Wrong!!"))
                                          .show(context);
                                    }
                                  }
                                } else {
                                  MotionToast.error(
                                          title: Text("Error"),
                                          description:
                                              Text("Something is Wrong!!"))
                                      .show(context);
                                }
                              }, 42, 0.75, 19),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
