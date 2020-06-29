import 'package:flutter/material.dart';
class InfoTile extends StatelessWidget {
  final icon;
  final info;
  const InfoTile({
    Key key,
    @required this.icon,
    @required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ListTile(
        title: Text(
          info,
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
