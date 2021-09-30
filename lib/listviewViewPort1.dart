import 'package:flutter/material.dart';

void main() {
  runApp(ListViewViewPort1());
}

class ListViewViewPort1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: buildTwoSliverList(),
      ),
    );
  }
}

///页面中有两个 ListView，各占可视区域一半高度，虽然能够显式出来，但每一个 ListView 只会响应自己可视区域中滑动，
///实现不了我们想要的效果。之所以会这样的原因是两个 ListView 都有自己独立的 Scrollable 、 Viewport
///和 Sliver，既然如此，我们自己创建一个共用的 Scrollable 和 Viewport 对象，然后再将两个 ListView 对应的 Sliver
///添加到这个共用的 Viewport 对象中就可以实现我们想要的效果了。如果这个工作让开发者自己来做无疑是比较麻烦的，因此 Flutter
/// 提供了一个 CustomScrollView 组件来帮助我们创建一个公共的 Scrollable 和 Viewport ，然后它的 slivers 参数接受一个 Sliver 数组，
/// 这样我们就可以使用CustomScrollView 方面的实现我们期望的功能了：
Widget buildTwoSliverList() {
  var listView = ListView.builder(
    itemCount: 20,
    itemBuilder: (_, index) => ListTile(title: Text('$index')),
  );
  return Column(
    children: [
      Expanded(child: listView),
      Divider(color: Colors.grey),
      Expanded(child: listView),
    ],
  );
}
