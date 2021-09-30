import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _ProgressRoute(),
    );
  }
}

class _ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<_ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.red, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.all(16),
//            child: LinearProgressIndicator(
//              backgroundColor: Colors.grey[200],
//              valueColor: ColorTween(begin: Colors.red, end: Colors.blue)
//                  .animate(_animationController), // 从灰色变成蓝色
//              value: _animationController.value,
//            ),
//          )
//        ],
//      ),
//    ));
//  }
}
