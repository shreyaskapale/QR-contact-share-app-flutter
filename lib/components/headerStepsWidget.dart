import 'package:flutter/material.dart';


class Steps extends StatelessWidget {

  final active;
  final num;
  var cactive;
  var cicon;
  Steps(this.active, this.num){
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
