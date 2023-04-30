import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
late SharedPreferences saveddata;

void main() {

  runApp(ApiApp());
}
class ApiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "First App Adv",
      home: Home(),
    );
  }}