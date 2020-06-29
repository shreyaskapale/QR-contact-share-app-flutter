import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class GlowButton extends StatelessWidget {
  final Icon ico;
  final Function onPressed;
  final Color glowColor;
  final Color fillColor;
  GlowButton(this.ico,this.onPressed,this.glowColor,this.fillColor);

  @override
  Widget build(BuildContext context) {
    return GlowAnimation(onPressed: onPressed, ico: ico,glowColor: glowColor,);
  }
}

class GlowAnimation extends StatelessWidget {
  const GlowAnimation({
    Key key,
    @required this.onPressed,
    @required this.ico,
    @required this.glowColor,
    @required this.fillColor,
  }) : super(key: key);

  final Function onPressed;
  final Icon ico;
  final Color glowColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: Duration(milliseconds: 1000),
      glowColor: glowColor,
      endRadius: 70.0,
      duration: Duration(milliseconds: 2000),
      repeat: true,
      showTwoGlows: true,
      repeatPauseDuration: Duration(milliseconds: 100),
      child: RawMaterialButton(
        onPressed:onPressed,
        elevation:6,
        disabledElevation: 10,
        shape:CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 66.0,
          height: 66.0,
        ),
        fillColor: fillColor,

        child: ico,

      ),
    );
  }
}
