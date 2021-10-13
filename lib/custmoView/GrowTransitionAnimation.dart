import 'package:flutter/material.dart';

///封装的动画组件
///...
//Widget build(BuildContext context) {
//  return GrowTransition(
//    child: Image.asset("images/avatar.png"),
//    animation: animation,
//  );
//}
class GrowTransition extends StatelessWidget {
  GrowTransition({
    required this.animation,
    this.child,
  });

  final Widget? child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return Container(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
