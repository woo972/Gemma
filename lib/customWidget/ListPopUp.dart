import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// https://www.coderblog.in/2019/04/how-to-create-popup-window-in-flutter/
class ListPopUp extends ModalRoute {
  double top;
  double bottom;
  double left;
  double right;
  final Widget child;

  ListPopUp(
      {Key key,
      @required this.child,
      this.top,
      this.bottom,
      this.left,
      this.right});

  @override
  // The color to use for the modal barrier. If this is null, the barrier will be transparent
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  // Whether you can dismiss this route by tapping the modal barrier.
  bool get barrierDismissible => false;

  @override
  // The semantic label used for a dismissible barrier
  String get barrierLabel => null;

  @override
  // Whether the route should remain in memory when it is inactive
  bool get maintainState => false;

  @override
  // Whether the route obscures previous routes when the transition is complete
  bool get opaque => false;

  @override
  // The duration the transition lasts.
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    if (top == null) this.top = 10;
    if (bottom == null) this.bottom = 20;
    if (left == null) this.left = 20;
    if (right == null) this.right = 20;

    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material(
        // This makes sure that text and other content follows the material style
        type: MaterialType.transparency,
        //type: MaterialType.canvas,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }

  //the dynamic content pass by parameter
  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: this.bottom,
          left: this.left,
          right: this.right,
          top: this.top),
      child: child,
    );
  }
}
