import 'dart:convert';
import 'package:first_task_api/drawer.dart';
import 'package:first_task_api/products.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Category extends StatelessWidget {

  List<String> values = [
    'assets/images/shose.png',
    'assets/images/tsh.jpg',
    'assets/images/jacket.png',
    'assets/images/sh.jpg',
    'assets/images/jj.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(192, 53, 97, 0.9),
        title: Text('Categories'),
      ),
      drawer:MyDrawer(),
      body: Stack(
        children: [
          FutureBuilder(
          future: http.get(Uri.parse("https://rms4design.com/flutter/categories.php")),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data  != null) {
              dynamic data = json.decode(snapshot.data.body);
              return Center(
                child: GridView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 50,
                      child: ListView(
                          children: [
                            Center(
                                child:Text(data[index]["name"],
                                  style: TextStyle(color:  Color.fromRGBO(192, 53, 97, 0.9), fontWeight: FontWeight.w900, fontSize: 20),)),
                            SizedBox(height: 10,),
                            ClipRRect(
                              child:
                              GestureDetector(
                                child: Container(
                                    width: 200,
                                    height: 150,
                                    child: Image.asset(values[index])),
                                onTap:  (){
                                  Navigator.push(context, MaterialPageRoute(builder: (contets) => Products(
                                      id:"${data[index]["id"]}"
                                  )));
                                },
                              ),
                            ),
                          ]

                      ),
                    );
                  },
                  padding: EdgeInsets.all(5.0),
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              );

            } else {
              return Text("No Connection");
            }
          },
        ),
    ]
      ),
    );
  }
}
