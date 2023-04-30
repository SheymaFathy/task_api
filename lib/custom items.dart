import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomedContainer extends StatelessWidget {
  double x = 0, y = 0;
  dynamic child;
  double height = 0;

  CustomedContainer(this.x, this.y, this.height, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(x), topRight: Radius.circular(y)),
      ),
      child: child,
    );
  }
}

class AppBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/bg.gif",
              ),
              fit: BoxFit.cover)),
    );
  }
}

class CustomBtn extends StatelessWidget {
  dynamic backcolor = Color.fromRGBO(13, 6, 88, 0.8);
  dynamic fontColor = Colors.white;
  final VoidCallback ontap;

  double width = 0;
  double height = 0;
  double fontSize = 0;

  String text = "";

  CustomBtn(this.text, this.backcolor, this.fontColor, this.ontap, this.height,
      this.width, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      height: height,
      minWidth: MediaQuery.of(context).size.width * width,
      color: backcolor,
      textColor: fontColor,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            fontFamily: "title"),
      ),
      onPressed: ontap,
    );
  }
}

class FormFields extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  dynamic prefix;
  dynamic suffix;
  String myInput = "";
  bool IsObsecure;
  dynamic function;

  FormFields(this.myInput, this.prefix, this.suffix, this.IsObsecure,
      this.textFieldController);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (String? text) {
          if (textFieldController.text == '') {
            return 'This Field is Required.';
          }
        },
        obscureText: IsObsecure,
        cursorColor: Colors.grey,
        controller: textFieldController,
        decoration: InputDecoration(
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.white,
          floatingLabelStyle:
              const TextStyle(color: Color.fromRGBO(13, 6, 88, 0.8)),
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Color.fromRGBO(13, 6, 88, 0.8),
            ),
          ),
          labelText: myInput,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ));
  }
}

class ProductsCard extends StatelessWidget {

  late String image;
  late String name;
  late String price;
  ProductsCard(this.image, this.name, this.price,);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return    Expanded(
      child: Card(
        margin: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Image.network(image,fit: BoxFit.cover,height: 100,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              price + ' EGP',
              style: TextStyle(fontSize: 15, ),
            )
          ],
        ),
      ),
    );

  }
}

class ProductDetail extends StatelessWidget {
  String name;
  String description;
  String img;
  String price;
  ProductDetail(this.name,this.description,this.price,this.img);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromRGBO(192, 53, 97, 0.9),
        title: Text("Details"),
      ),
      backgroundColor: Color.fromRGBO(239, 241, 245, 0.9),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 600,
              child: Image.network(
                img, fit: BoxFit.cover,),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top:400),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                    color: Colors.white,

                    border: Border.all(color: Colors.grey.shade300)


                ),
                child:ListView(
                  //crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Color.fromRGBO(192, 53, 97, 0.9),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(description,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right:20 ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(price+" EGP",
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.8),
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Expanded(
                            child: MaterialButton(onPressed: (){
                              Navigator.pop(context);
                            },
                              minWidth: MediaQuery.of(context).size.width*0.35,
                              height: 55,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              color:  Color.fromRGBO(192, 53, 97, 0.9),
                              child: Text("Add to cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.5
                                ),
                              ),),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ) ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

