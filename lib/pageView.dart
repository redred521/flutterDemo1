// Flutter code sample for PageView
//
// Here is an example of [PageView]. It creates a centered [Text] in each of the three pages
// which scroll horizontally.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp2());

/// This is the main application widget.
class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 1);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        Container(color: Colors.green, child: Text('First Page')),
        Container(
          margin: EdgeInsets.only(top: 100.0, left: 260.0, bottom: 200),
          //容器外填充
          constraints: BoxConstraints.tightFor(width: 50.0, height: 60.0),
          //卡片大小
          decoration: BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                  //背景径向渐变
                  colors: [Colors.red, Colors.orange],
                  center: Alignment.topLeft,
                  radius: .98),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0)
              ]),
          transform: Matrix4.rotationZ(0.2),
          //卡片倾斜变换
          alignment: Alignment.center,
          //卡片内文字居中
          child: Text(
            //卡片文字
            "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
          ),
        ),
        Center(
          child: Container(
              color: Colors.amber,
              child: Text('Third Page', style: TextStyle())),
        )
      ],
    );
  }
}
