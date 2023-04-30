import 'package:first_task_api/Categories.dart';
import 'package:first_task_api/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Drawer(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [

                UserAccountsDrawerHeader(
                  accountName: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height:30,),
                      Text(
                        saveddata.getString ("phone") as String ,
                        style: TextStyle(color: Color.fromRGBO(192, 53, 97, 0.9), fontSize: 15.0, fontFamily: 'reg'),
                      ),
                    ],
                  ),
                  accountEmail: Text(
                    saveddata.getString ("name") as String ,
                    style: TextStyle(color: Color.fromRGBO(192, 53, 97, 0.9), fontSize: 15.0, fontFamily: 'reg'),
                  ),
                  currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      backgroundColor:  Color.fromRGBO(192, 53, 97, 0.9),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: Colors.grey[100]),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context)=>Category()));},
                        child: ListTile(
                          title: Text(
                            " All Categories",
                            style: TextStyle(color:Color.fromRGBO(192, 53, 97, 0.9), fontSize: 17.0, fontFamily: 'reg'),
                          ),
                          leading: Icon(
                            Icons.home,
                            color: Color.fromRGBO(192, 53, 97, 0.9),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color.fromRGBO(192, 53, 97, 0.9),
                            size: 18.0,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[500],
                      ),
                    ],
                  ),
                ),
             ]
            ),
          ),
        ),
      ),
    );
  }
}