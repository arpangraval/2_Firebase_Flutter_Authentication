import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_firestore/signup.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  final _loginemailaddress = TextEditingController();
  final _loginpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
          backgroundColor: Colors.white,

        body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
              width: w,
              height: h*0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/login.png"
                  )

                )
              ),
            ),
          ),
          Center(
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Sign in from Here into your Account",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500]
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        width: 350,
                        child: TextField(
                          controller: _loginemailaddress,
                          decoration: InputDecoration(
                            hintText: "Email",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular( 20)
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Container(
                        width: 350,
                        child: TextField(
                          controller: _loginpassword,
                          decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular( 20)
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        "Forgot your Password?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500]
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: w,
            child: Column(
              children: [
                ElevatedButton(
                  child: Text('Sign in'),
                  onPressed: () {
                    FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginemailaddress.text, password: _loginpassword.text).then((value){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> Home()));
                    }).onError((error, stackTrace){
                      print("Error: ${error.toString()}");
                    });
                  },
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=> SignUp()));
                  },
                    child: Text(
                "Click to Create Account !!",
                style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500]
                ),
                )

                ),

              ],
            ),

          )
        ],
      )
    );


  }
}
