import 'package:flutter/material.dart';

import 'neu_container.dart';


class NeuValueBar extends StatefulWidget {
  double maxValue;
  double currentValue;
   Color color;
  final double width;
  double height;
  final double borderRadius;
  final Widget child;

  NeuValueBar(
      {this.maxValue = 1,
      this.currentValue = 0.5,
      this.color,
      this.width,
      this.height,
      this.borderRadius = 0,
      this.child}) {
    this.currentValue = this.currentValue / this.maxValue;
    this.maxValue = 1;
    if (height < 30) this.height = 30;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NeuValueBarState();
  }
}

class _NeuValueBarState extends State<NeuValueBar>
    with TickerProviderStateMixin {
  AnimationController _animationController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        lowerBound: widget.currentValue,
        upperBound: widget.maxValue,
        duration: Duration(milliseconds: 1000));
    _animationController.addListener(() {

        setState(() {
          widget.currentValue = _animationController.value;
        });

    });

    if(widget.currentValue < widget.maxValue)
    _animationController.reverse(from: widget.maxValue);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        NeuContainerReverse(
            borderRadius: widget.borderRadius,
            child: Container(
              width: widget.width + 20,
              height: widget.height,
            )),
        NeuContainer(
            borderRadius: widget.borderRadius,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  gradient: LinearGradient(colors: [
                    widget.color,
                    widget.color.withOpacity(0.7),
                    widget.color.withOpacity(0.5)
                  ])),
              width: widget.width * widget.currentValue,
              height: widget.height - 20,
              child:  widget.child ,
            ))
      ],
    );
  }
}
