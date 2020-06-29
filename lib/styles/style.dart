import 'package:flutter/material.dart';


const inputBoxBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.white),
);
const inputBoxBorderActive = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10.0)),
  borderSide: BorderSide(color: Colors.blue),
);



const winblows95inputBox = InputDecoration(
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
));