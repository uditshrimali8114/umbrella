
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umbrella/home_page.dart';
import 'package:umbrella/register_screen.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignIn> {
  GetStorage box = GetStorage();
  var _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? token;

  @override
  void initState() {

  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else{
      LoginCheck();

    }
  }
  var regEmail,regmob,regPass;

  bool isNumericUsing_tryParse(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  bool isNumericUsingRegularExpression(String string) {
    final numericRegex =
    RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$');

    return numericRegex.hasMatch(string);
  }

  LoginCheck(){

    setState(() {
      regEmail=box.read("email");
      regmob=box.read("mob");
      regPass=box.read("pass");
    });

    if (isNumericUsing_tryParse(emailController.text)){
      if(regmob == emailController.text && regPass == passController.text ){
        print("Login With mob success");
        Fluttertoast.showToast(msg: "Login With Number success",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white
        );
        Get.offAll(()=>HomePage());
      }else{
        print("enter wrong  number or pass");
        Fluttertoast.showToast(msg: "Entered wrong number or password",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
      }
    }else{
      if(regEmail == emailController.text && regPass == passController.text ){
        print("Login With Email success");
        Fluttertoast.showToast(msg: "Login With Email success",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white
        );
        Get.offAll(()=>HomePage());
      }else{
        print(" enter wrong  Email or pass");
        Fluttertoast.showToast(msg: "Entered wrong email or password",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white
        );
      }
    }

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: height*0.05,
                ),
                Container(
                  child: Image.asset("assets/img.jpg"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child:  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                      children: <TextSpan>[

                        TextSpan(text: 'Welcome to',style: TextStyle(color:Colors.black )),
                        TextSpan(text: ' umbrella',style: TextStyle(color: Color(0xFF4abdbd))),

                      ],
                    ),
                  ),
                  // child: Text("Welcome to Umbrella",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ),


                Container(
                  width: width*0.70,
                  height: 40,
                  margin: EdgeInsets.only(left: 15,top: 15),
                  child: Text("A Simple chat platform for everyday use",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),),
                ),
                SizedBox(
                  height: 15,
                ),

                SizedBox(
                  height: 15,
                ),

                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                      ),],
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10)
                    //borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.only(left: 5),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset('assets/user.png'),
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 4),
                            // height: 50,
                            alignment: Alignment.center,
                            width: size.width * 0.59,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black),
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: 'Email Address or Phone Number',
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )


                              ),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ) {
                                  return 'Enter a valid email or phone number!';
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                      ),],
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10)
                    //borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: EdgeInsets.only(left: 5),
                  width: size.width * 0.9,


                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Container(
                              width: 30,
                              height: 30,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset("assets/mail01.png"),
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 4),
                            // height: 50,
                            alignment: Alignment.center,
                            width: size.width * 0.5,
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black),
                              controller: passController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )


                              ),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ) {
                                  return 'Enter Password';
                                }
                                return null;
                              },
                            ),
                          ),

                        ],
                      )

                    ],
                  ),
                ),

                SizedBox(height: 15,),
                Container(

                  width: width*0.79,
                  // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child:FlatButton(
                    height: height*0.06,

                    child: Text("Sign in", style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
                    color:Color(0xFF4abdbd),//D61212
                    textColor: Colors.white,
                    onPressed: () {
                      _submit();
                    },
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),

                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                Container(
                  width: width*0.70,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text("or connect using",style: TextStyle(fontSize: 16,color: Colors.grey),),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(

                      width: width*0.40,
                      // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child:FlatButton(
                        height: height*0.055,

                        child: Text("facebook", style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        color:Color(0xFF385c8e),//D61212
                        textColor: Colors.white,
                        onPressed: () {
                        },
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),

                      ),
                    ),
                    Container(

                      width: width*0.40,
                      // padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child:FlatButton(
                        height: height*0.055,

                        child: Text("Gmail", style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
                        color:Color(0xFFf14436),//D61212
                        textColor: Colors.white,
                        onPressed: () {
                        },
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),

                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    Get.off(()=>Signup());
                  },
                  child:  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14),
                      children: <TextSpan>[

                        TextSpan(text: 'Don\'t have an account?',style: TextStyle(color:Colors.black )),
                        TextSpan(text: ' Sign Up',style: TextStyle(color: Color(0xFF4abdbd))),

                      ],
                    ),
                  ),
                  // child: Text("Welcome to Umbrella",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}

// || RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$').hasMatch(value)