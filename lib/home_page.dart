
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umbrella/first_screen.dart';
import 'package:umbrella/login_screen.dart';
import 'package:umbrella/register_screen.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? token;

  @override
  void initState() {
getData();
  }
  var regEmail,regmob,regPass;
  GetStorage box = GetStorage();

  getData(){
    setState(() {
      regEmail=box.read("Name");
      // regmob=box.read("mob");
      // regPass=box.read("pass");
    });
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
        child: Center(
          // margin: EdgeInsets.all(25),
          child: Container(

            child: Column(
              children: [

                SizedBox(
                  height: 200,
                ),
                Text("Welcome To Umbrella $regEmail"),
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: (){
                    box.remove("Name");
                    box.remove("email");
                    box.remove("mob");
                    box.remove("pass");
                    Fluttertoast.showToast(msg: "All Saved Data Cleared",
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white
                    );
                    Get.offAll(()=>FirstScreen());
                  },
                  child: Container(
                    height: 50,
                    width: 180,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xFF4abdbd),
                      borderRadius: BorderRadius.circular(10),
                    ),
                      child: Text("Logout from here",style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}