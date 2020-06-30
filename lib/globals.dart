import 'screens/first.dart';
import 'screens/second.dart';
import 'screens/third.dart';
import 'screens/home.dart';

var name, email, phone, fName, fEmail, fPhone;
final routes = {
  Home.route: (context) => Home(),
  First.route: (context) => First(),
  Second.route: (context) => Second(),
  Third.route: (context) => Third(),
};