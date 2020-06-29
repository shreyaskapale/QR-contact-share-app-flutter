import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:panme/savefunctions.dart';
import 'store.dart';
import 'home.dart';
class Mixing extends StatefulWidget {
  @override
  _MixingState createState() => _MixingState();
}

class _MixingState extends State<Mixing> with TickerProviderStateMixin {
  AnimationController _controller;
var pname;
  @override
  void initState() {

    _controller = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );
    super.initState();


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Generating your QR"),
      ),
      body: Column(
        children: <Widget>[
          Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    child: RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Image.asset("assets/images/drk1.png",width: 400,height: 400,)),
                  ),
                ),
                Image.asset("assets/images/flutterbird.png",width: 100,height: 100,)
              ]
          ),
          Container(
            height: 300,
            width:300,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1,color: Color(0xff0DCBFC))
            ),
            child: TypewriterAnimatedTextKit(
                totalRepeatCount: 1,
                speed: Duration(milliseconds: 10 ),
                onFinished: (){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                  );

                },
                text: [
                  "Hey, "+name.text,
                  "We are creating your QR",
                  "Using the information from",
                  "PRESENT",
                  "PAST",
                  "FUTURE",
                  "Processing....",
                  "Done",
                  "forwarding you to your HOME",
                  "welcome to Panme"
                ],
                textStyle: TextStyle(
                    color:  Color(0xff0DCBFC),
                    fontSize: 20.0,
                    fontFamily: "Agne"
                ),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart // or Alignment.topLeft
            ),
          ),
        ],
      )
    );
  }
}