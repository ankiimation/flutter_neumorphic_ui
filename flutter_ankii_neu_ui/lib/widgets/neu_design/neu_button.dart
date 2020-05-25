import 'package:flutter/material.dart';

import 'neu_container.dart';

class NeuButton extends StatefulWidget {
  final double borderRadius;
  final Widget child;
  final Function onPress;

  NeuButton({this.borderRadius = 0, this.child, this.onPress});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NeuButtonState();
  }
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPress = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isPress = true;
          });
          if (widget.onPress != null) widget.onPress();
        },
        onTapUp: (_) {
          setState(() {
            _isPress = false;
          });
        },
        onTapCancel: () {
          setState(() {
            _isPress = false;
          });
        },
        child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: _isPress
                ? Container(
                    margin: EdgeInsets.all(10),
                    child: NeuContainerReverse(
                      borderRadius: widget.borderRadius,
                      child: widget.child,
                    ))
                : NeuContainer(
                    borderRadius: widget.borderRadius, child: widget.child)));
  }
}
