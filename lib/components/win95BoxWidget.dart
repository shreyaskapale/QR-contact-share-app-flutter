import 'package:flutter/material.dart';
import '../services/savefunctions.dart';
import '../screens/third.dart';
import '../styles/style.dart';
import '../globals.dart';
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

                decoration:  winblows95inputBox),
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
                Navigator.pushNamed(context,Third.route);

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