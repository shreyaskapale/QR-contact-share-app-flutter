import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import '../globals.dart';
import 'screens/../second.dart';
import '../services/savefunctions.dart';
import '../components/headerStepsWidget.dart';
import '../components/glowButtonWidget.dart';
import '../components/appearAnimationWidget.dart';
import '../styles/style.dart';
class First extends StatefulWidget {
  static const route = "first";
  First({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<First> {
  @override
  bool _visible = false;
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,

        appBar: AppBar(

          title: Row(
            children: <Widget>[
              Text("Getting Started"),
              Spacer(),
              Steps(1,1),
              Steps(0,2),
              Steps(0,3),
            ],
          ),
        ),
        body: Container(
          color:Color(0xff071829),
          child: SizedBox(
            width: double.infinity,

            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Image.asset("assets/images/orbit.gif"),
                  TypewriterAnimatedTextKit(
                      totalRepeatCount: 1,
                      speed: Duration(milliseconds:80 ),
                      onFinished: (){
                        setState(() {
                          _visible=true;
                        });
                      },
                      text: [
                        "Hello welcome to Panme",
                        "Panme - post pandemic meet",
                        "we will help you share contacts",
                        "contactless-ly using QR codes",
                        "Lets start",
                        "Whats your name ? "

                      ],
                      textStyle: TextStyle(
                          fontSize: 20.0,
                          fontFamily: "Agne"
                      ),
                      textAlign: TextAlign.start,
                      alignment: AlignmentDirectional.topStart // or Alignment.topLeft
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AppearAnimation(visible: _visible, nameController: nameController,appearingChild: Column(

                    children: <Widget>[
                      Container(
                        width: 280,
                        child: TextField(
                          style: TextStyle(
                              fontSize: 18
                          ),
                          decoration: InputDecoration(
                            hintText: "Name",
                            border: InputBorder.none,
                            enabledBorder: inputBoxBorder,
                            focusedBorder: inputBoxBorderActive,
                          ),
                          textAlign: TextAlign.center,
                          controller: nameController,

                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GlowButton(Icon(Icons.navigate_next,color: Colors.black,),() async {
                        if(nameController.text.length>0){
                          print(nameController.text);
                          await saveShared("pname", nameController.text);
                          name = nameController;
                        }
                        Navigator.pushNamed(context,Second.route);
                      },Colors.white,Colors.white)
                    ],
                  ),),
                ],
              ),
            ),
          ),
        )
    );
  }
}

