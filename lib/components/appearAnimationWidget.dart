import 'package:flutter/material.dart';

class AppearAnimation extends StatelessWidget {
  const AppearAnimation({
    Key key,
    @required bool visible,
    @required this.nameController,
    @required this.appearingChild,
  }) : _visible = visible, super(key: key);

  final bool _visible;
  final TextEditingController nameController;
  final Widget appearingChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child:appearingChild
    );
  }
}
