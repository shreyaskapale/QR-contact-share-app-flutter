import 'package:flutter/material.dart';
import 'store.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'scanResult.dart';
import 'package:animated_background/animated_background.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue,
      appBar: AppBar(
        title: Text("Panme - Post Pandemic Meets"),
      ),
      body: Center(
        child: AnimatedBackground(
          behaviour: RandomParticleBehaviour(),
          vsync: this,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your QR",style: TextStyle(
                  color:Colors.white
                ),),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration:BoxDecoration(
                      color: Colors.white,
                   borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(10, 10), //(x,y)

                      ),
                    ],
                  ),
                  child: QrImage(
                    data: name.text+";"+phone.text+";"+email.text,
                    version: QrVersions.auto,
                    size: 250.0,
                  ),
                ),

                Text("Scan Others",style: TextStyle(
                    color:Colors.white
                ),),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 270,
                  height: 270,
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(10, 10), //(x,y)

                      ),
                    ],
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      String res = await FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", false, ScanMode.DEFAULT);
                      print(res);
                      var info = res.split(';');
                      fName = info[0];
                      fPhone = info[1];
                      fEmail = info[2];
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScanResult()
                          ));
                    },
                    child: Icon(
                      Icons.camera_alt,
                      size: 100,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text("Made with ❤ By Shreyas Kapale")
              ],
            ),
          ),
        )
      ),
    );
  }
}