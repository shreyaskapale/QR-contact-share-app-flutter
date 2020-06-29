import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/savefunctions.dart';
import 'screens/first.dart';


Future<void> main() async {
  runApp(MyApp());
//  var x =await getShared("pname");
//  var y = await getShared("pnum");
//  var z = await getShared("pmail");
//  print(x);
//  print(y);
//  print(z);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post Pandemic Meet',
      theme: ThemeData.dark(),
      home: FirstPage(),
    );
  }
}
