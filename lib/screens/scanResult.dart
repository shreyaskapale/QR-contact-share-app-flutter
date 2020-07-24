import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:contacts_service/contacts_service.dart';
import '../components/infoTileWidget.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Contact Saved"),
    content: Text("You successfully tackled corona"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class ScanResult extends StatefulWidget {
  @override
  _ScanResultState createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Found Contact"),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(),
        vsync: this,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Text(
                fName + " QR code",
                style: TextStyle(color: Colors.white),
              ),
              Container(
                decoration: BoxDecoration(
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
                  data: fName + ";" + fPhone + ";" + fEmail,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    InfoTile(
                      icon: Icons.person,
                      info: fName,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InfoTile(
                      icon: Icons.phone,
                      info: fPhone,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InfoTile(
                      icon: Icons.phone,
                      info: fPhone,
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(5, 5), //(x,y)
                    ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () async {
                     String displayName = fName;
                     Iterable<Item> emails = [fEmail];
                     Iterable<Item> phones = [fPhone];
                     print("saving !");
                     var newContact = Contact(
                       displayName: displayName,
                       emails: emails,
                       phones: phones,
                     );
                     await ContactsService.addContact(newContact);
                    setState(() {
                      showAlertDialog(context);
                    });
                  },
                  child: Text(
                    "Save to Contacts",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

