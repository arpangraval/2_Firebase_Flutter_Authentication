import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_firestore/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
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
  final _emailaddress = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                width: w,
                height: h * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "img/signup.jpg"
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
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Sign up from Here to Create your Account",
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
                            controller: _emailaddress,
                            decoration: InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
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
                            controller: _password,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.password),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                )
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

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
                    child: Text('Sign Up'),
                    onPressed: () {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailaddress.text, password: _password.text).then((value){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                      }).onError((error, stackTrace) {
                        print("Error: ${error.toString()}");
                      });

                    },

                  ),
                  SizedBox(height: 20,),
                  
                  GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Login()));
                      },
                      child: Text(
                    "Already have an Account? Click Here !!",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500]
                    ),
                  )),
                ],
              ),

            )
          ],
        )
    );
  }


}
