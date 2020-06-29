import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'third.dart';
import 'savefunctions.dart';
import 'store.dart';
class Second extends StatefulWidget {
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
            steps(0,1),
            steps(1,2),
            steps(0,3),
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
            // If the widget is visible, animate to 0.0 (invisible).
            // If the widget is hidden, animate to 1.0 (fully visible).
            opacity: _visible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            // The green box must be a child of the AnimatedOpacity widget.
            child:Center(
              child: Old95container()

            ),
          ),
        ],
      ),
    );
  }
}


class Old95container extends StatefulWidget {
  @override
  _Old95containerState createState() => _Old95containerState();
}

class _Old95containerState extends State<Old95container> {
  final numberController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        color: Color(0xffC0C0C0),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(1, 1.0), //(x,y)

          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            width: double.maxFinite,
            height: 35,
            child: Row(
              children: <Widget>[
                Text(" Switch to Linux"),
                Spacer(),
                Container(
                  height: 20,
                  width: 20,

                  child: Center(child: Icon(Icons.close,size: 15,color: Colors.black,)),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(

                        offset: Offset(0.0, 1.0), //(x,y)

                      ),
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Color(0xff000080),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0), //(x,y)

                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text("Enter your phone number",style: TextStyle(
            color: Colors.black
          ),),
          SizedBox(
            height: 20,
          ),
          Container(

            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(1, 1), //(x,y)

                ),
              ],
            ),
            child: TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontSize: 16,
                color:Colors.black
              ),

              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(0.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(0.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 1.0),
                ),

              ),),
          ),
          SizedBox(height: 10,),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xffC0C0C0),
              border: Border.all(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(1, 1), //(x,y)

                ),
              ],
            ),

            child: FlatButton(
              onPressed: () async {
                if(numberController.text.length>0){
                  print(numberController.text);
                  await saveShared("pnum",numberController.text);
                }
                phone = numberController;
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Third()
                    ));

              },
              child: Text("Submit",style: TextStyle(
                color: Colors.black
              ),),


            ),
          )

        ],
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

