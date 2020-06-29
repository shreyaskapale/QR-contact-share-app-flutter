import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'store.dart';
import 'second.dart';
import 'savefunctions.dart';
Future<void> main() async {
  runApp(MyApp());
  var x =await getShared("pname");
  var y = await getShared("pnum");
  var z = await getShared("pmail");
  print(x);
  print(y);
  print(z);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Pandemic Meet',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              steps(1,1),
              steps(0,2),
              steps(0,3),
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
              AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: _visible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                // The green box must be a child of the AnimatedOpacity widget.
                child:Column(
                 
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        controller: nameController,

                      ),
                    ),
                   SizedBox(
                     height: 20,
                   ),
                   RoundIconButton(Icon(Icons.navigate_next,color: Colors.black,),() async {
                     if(nameController.text.length>0){
                       print(nameController.text);
                       await saveShared("pname", nameController.text);
                       name = nameController;
                     }
                     Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Second()
                     ));
                   })
                  ],
                ),
              ),



                ],
              ),
            ),
          ),
        )
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final Icon ico;
  final Function onPressed;
  RoundIconButton(this.ico,this.onPressed);

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: Colors.white,
      endRadius: 70.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: RawMaterialButton(
        onPressed:onPressed,
        elevation:6,
        disabledElevation: 10,
        shape:CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 66.0,
          height: 66.0,
        ),
        fillColor: Colors.white,

        child: ico,

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
