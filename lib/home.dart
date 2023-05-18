import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_firestore/login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.lightBlue,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 160),
        child: Column(

        children: [
          Center(

            child: GestureDetector(
            child: Text("Logout",
                style: TextStyle(fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
      ),

            ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Login()));
              }
            ),
          )
        ],
      )

    ));
  }
}
