import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'savefunctions.dart';
import 'mixing.dart';
import 'store.dart';
import 'home.dart';
class Third extends StatefulWidget {

  @override
  _ThirdState createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  @override
  bool _visible = false;
  bool selected = false;

  var _bgColor = Colors.black;

  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Lets get your email"),
            Spacer(),
            steps(0,1),
            steps(0,2),
            steps(1,3),
          ],
        ),
      ),
      backgroundColor: _bgColor,
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            SizedBox(
              height:10 ,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1,color: Color(0xff0DCBFC))
              ),
              child: FadeAnimatedTextKit(
                  totalRepeatCount: 1,
                  onFinished: (){
                    setState(() {
                      _visible = true;
                      selected = true;
                    });
                  },
                  text: [
                    "Welcome to the future",

                  ],
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: "Agne"
                  ),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
            ),

            AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              // The green box must be a child of the AnimatedOpacity widget.
              child:Center(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(width: 1,color: Color(0xff0DCBFC))
                          ),
                          child: Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Image.asset("assets/images/hud.gif"),
                                Text(name.text),
                              ]
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(width: 1,color: Color(0xff0DCBFC))
                          ),
                          child: TypewriterAnimatedTextKit(
                              totalRepeatCount: 1,
                              speed: Duration(milliseconds: 100 ),
                              onFinished: (){
                                setState(() {
                                  _visible = true;


                                });
                              },
                              text: [
                                "Loading...",
                               "Welcome to the final step",
                                "Whats your email ?",

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
                        Container(
                          width: double.infinity,


                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(width: 1,color: Color(0xff0DCBFC))
                          ),
                          child: Column(
                            children: <Widget>[

                              Container(
                                child: TextField(
                                  controller: emailController,
                                  autofocus: true,
                                  keyboardType: TextInputType.emailAddress,

                                ),
                                width: 380,
                              ),
                              RoundIconButton(Icon(Icons.navigate_next,color: Colors.white,),() async {

                                  if(emailController.text.length>0){
                                    print(emailController.text);
                                    await saveShared("pmail",emailController.text);
                                  }
                                  email=emailController;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Mixing()
                                      ));

                              })
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class steps extends StatelessWidget {

  final active;
  final num;
  var cactive;
  var cicon;
  steps(this.active, this.num){
    if(active==1){
      cactive = Colors.white.withOpacity(0.4);
    }else{
      cactive = Colors.transparent;
    }
    switch(num){
      case 1:
        cicon = Icons.looks_one;
        break;
      case 2:
        cicon = Icons.looks_two;
        break;
      case 3:
        cicon = Icons.looks_3;
        break;

    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: cactive,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(cicon)
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final Icon ico;
  final Function onPressed;
  RoundIconButton(this.ico,this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: AvatarGlow(
        startDelay: Duration(milliseconds: 1000),
        glowColor: Color(0xff0DCBFC),
        endRadius: 70.0,
        duration: Duration(milliseconds: 2000),
        repeat: true,
        showTwoGlows: true,
        repeatPauseDuration: Duration(milliseconds: 100),
        child: RawMaterialButton(
          onPressed:onPressed,
          elevation:6,
          disabledElevation: 10,
          shape:CircleBorder(
            side: BorderSide(color: Color(0xff016982))
          ),
          constraints: BoxConstraints.tightFor(
            width: 66.0,
            height: 66.0,
          ),


          child: ico,

        ),
      ),
    );
  }
}

