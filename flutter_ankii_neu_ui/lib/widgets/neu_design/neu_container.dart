import 'package:flutter/material.dart';
import 'concave_decoration.dart';
import 'constant.dart';


class NeuContainer extends StatelessWidget {
  final double borderRadius;
  final Widget child;

  NeuContainer({this.borderRadius = 0, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: MAIN_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(borderRadius),
              boxShadow: [
                BoxShadow(
                    color: DARK_SHADOW.withOpacity(0.5),
                    offset: Offset(6, 2),
                    blurRadius: 6,
                    spreadRadius: 3),
                BoxShadow(
                    color: LIGHT_SHADOW.withOpacity(0.5),
                    offset: Offset(-6, -2),
                    blurRadius: 6,
                    spreadRadius: 3)
              ]),
          child: child,
        ));
  }
}

class NeuContainerReverse extends StatelessWidget {
  final double borderRadius;
  final Widget child;

  NeuContainerReverse({this.borderRadius = 0, this.child});

  @override
  Widget build(BuildContext context) {
    var fill = <Color>[Colors.grey[200], Color(0xFFf8fbf8), Colors.white];
    // TODO: implement build
    return Container(
      decoration: ConcaveDecoration(
          depression: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          colors: [DARK_SHADOW, LIGHT_SHADOW]),
      child: child,
    );
  }
}
