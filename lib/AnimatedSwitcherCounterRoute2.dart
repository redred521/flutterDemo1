import 'package:flutter/material.dart';

import 'custmoView/MySlideTransition.dart';
///另外，Flutter SDK中还提供了一个AnimatedCrossFade组件，它也可以切换两个子元素，
///切换过程执行渐隐渐显的动画，和AnimatedSwitcher不同的是AnimatedCrossFade是针对两个子元素，
///而AnimatedSwitcher是在一个子元素的新旧值之间切换。AnimatedCrossFade实现原理也比较简单，
///和AnimatedSwitcher类似，因此不再赘述，读者有兴趣可以查看其源码
void main() {
  runApp(AnimatedSwitcherCounterRoute1());
}

class AnimatedSwitcherCounterRoute1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("AnimatedSwitcher的高级用法"),
          ),
          body: AnimatedSwitcherCounterRoute()),
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
//  const AnimatedSwitcherCounterRoute({required Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
              );
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          RaisedButton(
            child: const Text(
              '+1',
            ),
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
