import 'dart:convert';
import 'package:first_task_api/custom%20items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget{
  final String id;
  const Products({Key? key, required this.id}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List products=[];
  int index = 0;
  Future<List> getItemById() async {
    final response = await http.get(Uri.parse("https://rms4design.com/flutter/products.php?id=${widget.id}"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      // return json.decode(response.body);
      products = data;
      index= products.length;
      return products;
    } else {
      throw Exception('Failed to fetch item');
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(192, 53, 97, 0.9),
        title: Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: FutureBuilder(
            future: getItemById(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Flexible(
                  child: CustomScrollView(
                      slivers: <Widget>[
                  SliverPadding(
                  padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children:
              List.generate(index, (index) => (index != 0)?GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(products[index]["name"],
                        products[index]["description"],products[index]["price"],products[index]["img"],
                      )));
                    },
              child: ListView(children:
              [ProductsCard(products[index]["img"],products[index]["name"],products[index]["price"])])): Center(child: Text("no data")) ,
              ).sublist(1)
              
              ))]),
                );

              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            }
        ),
      ),
    );
  }
}