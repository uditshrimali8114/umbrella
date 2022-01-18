
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:umbrella/login_screen.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  GetStorage box = GetStorage();
  var _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conpassController = TextEditingController();

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
      if(passController.text == conpassController.text)
      {
        getAndSave();
      }else{
        print("pass not matched");
        Fluttertoast.showToast(msg: "Password and Confirm password should be same",
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.redAccent,
            textColor: Colors.white
        );
      }

    }
  }

  getAndSave(){
    print("saved");
    box.write("Name", nameController.text);
    box.write("email", emailController.text);
    box.write("mob", mobController.text);
    box.write("pass", passController.text);

    Fluttertoast.showToast(msg: "Registered Successfully",
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
    Get.off(()=>SignIn());
  }

  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffcfdff),
        elevation: 0,
      ),
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
                  alignment: Alignment.centerLeft,
                  child:  Text("Signup", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                  // child: Text("Welcome to Umbrella",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                ),



                SizedBox(
                  height: 15,
                ),
                // NameTextFormField
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
                                  child: Image(
                                      image: AssetImage('assets/user.png')),
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
                              controller: nameController,
                              decoration: const InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(color: Colors.grey),
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
                                  return 'Enter Name!';
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

                //EmailTextFormField
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
                                  child: Image(
                                      image: AssetImage('assets/user.png')),
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
                              controller: emailController,
                              decoration: const InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(color: Colors.grey),
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
                                if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Enter a valid email';
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
                //MobileTextFormField
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
                                  child: Image(
                                      image: AssetImage('assets/user.png')),
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

                              controller: mobController,

                              decoration: const InputDecoration(

                                  hintText: 'Mobile Number',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )


                              ),
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty || value.length!=10) {
                                  return 'Enter a valid phone number!';
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
                                  child: Image(
                                      image: AssetImage('assets/user.png')),
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

                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )


                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ) {
                                  return 'Enter password';
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
                                  child: Image(
                                      image: AssetImage('assets/user.png')),
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
                              controller: conpassController,
                              decoration: const InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  labelStyle: TextStyle(
                                      color: Colors.grey
                                  )


                              ),
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty ) {
                                  return 'Enter Confirm Password';
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

                    child: Text("Sign up", style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),),
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


                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    Get.off(()=>SignIn());
                  },
                  child:  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 14),
                      children: <TextSpan>[

                        TextSpan(text: 'Already have an account?',style: TextStyle(color:Colors.black )),
                        TextSpan(text: ' Sign in',style: TextStyle(color: Color(0xFF4abdbd))),

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