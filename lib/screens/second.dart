import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/win95BoxWidget.dart';
import 'third.dart';
import '../services/savefunctions.dart';
import '../globals.dart';
import '../components/headerStepsWidget.dart';
import '../styles/style.dart';
class Second extends StatefulWidget {
  static const route = "second";
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  @override
  bool _visible = false;
  var _bgColor = Colors.black;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Lets get your number"),
            Spacer(),
            Steps(0,1),
            Steps(1,2),
            Steps(0,3),
          ],
        ),
      ),
      backgroundColor: _bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,


        children: <Widget>[
          TypewriterAnimatedTextKit(
              totalRepeatCount: 1,
              speed: Duration(milliseconds: 100 ),
              onFinished: (){
                setState(() {
                  _visible = true;
                  _bgColor = Color(0xff008182);

                });
              },
              text: [
                "Booting MS-DOS",
                "Starting Winblows 95",
                "Loaded",
                ""
              ],
              textStyle: TextStyle(
                color: Colors.lightGreen,
                  fontSize: 20.0,
                  fontFamily: "Agne"
              ),
              textAlign: TextAlign.start,
              alignment: AlignmentDirectional.topStart // or Alignment.topLeft
          ),

          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child:Center(
              child: Old95container()

            ),
          ),
        ],
      ),
    );
  }
}