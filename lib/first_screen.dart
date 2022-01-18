
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umbrella/login_screen.dart';
import 'package:umbrella/register_screen.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenPageState();
}

class _FirstScreenPageState extends State<FirstScreen> {

  String? token;

  @override
  void initState() {

  }
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;


    return Scaffold(
      backgroundColor: Color(0xfffcfdff),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: height*0.10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/logo.jpg"),
              ),
              Container(
                margin: EdgeInsets.only(right: 15),
                child: Text("Welcome to Umbrella",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
              ),
              Container(
                width: width*0.70,
                height: 40,
                margin: EdgeInsets.only(left: 20,top: 15),
                child: Text("A Simple chat platform for everyday use",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Image.asset("assets/img.jpg"),
              ),
              SizedBox(
                height: 15,
              ),
              Container(

                width: width*0.79,
                // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child:FlatButton(
                  height: height*0.07,

                  child: Text("Sign Up", style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
                  color:Color(0xFF4abdbd),//D61212
                  textColor: Colors.white,
                  onPressed: () {

                    Get.to(()=>Signup());
                  },
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(35)),

                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(

                width: width*0.79,
                // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                child:FlatButton(
                  height: height*0.07,

                  child: Text("Sign In", style: TextStyle(fontSize: 18.0,color: Color(0xFF4abdbd),fontWeight: FontWeight.bold),),
                  // color:Color(0xFF4abdbd),//D61212
                  textColor: Colors.white,
                  onPressed: () {
                    Get.to(()=> SignIn());
                  },
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Color(0xFF4abdbd),
                          width: 1,
                          style: BorderStyle.solid
                      ),
                      // side:BorderSide.,
                      borderRadius: BorderRadius.circular(35)),

                ),
              ),



            ],
          ),
        ),
      ),
    );
  }

}