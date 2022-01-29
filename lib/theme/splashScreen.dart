import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:newnote/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomePage())));



    return MaterialApp(
      home: Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome To NoteX',style: GoogleFonts.spaceGrotesk(
                fontWeight: FontWeight.w500,
                fontSize: 40,color: Colors.black
              )),
              Lottie.asset('assets/notes.json'),
              SizedBox(height: 30,),
            ],
          )
        ), //<- place where the image appears
      ),
    );
  }
}