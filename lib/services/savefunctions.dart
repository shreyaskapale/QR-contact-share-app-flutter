import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveShared(String s,String k) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(s, k);
}

getShared(String k) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String stringValue = prefs.getString(k);
  return stringValue;
}
