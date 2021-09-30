import 'package:flutter/material.dart';

import 'custmoView/SliverFlexibleHeader.dart';

void main() {
  runApp(SliverFlexibleHeaderDemo());
}

class SliverFlexibleHeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // AppBar，包含一个导航栏.
            CustomScrollView(
              //为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让 physics 支持弹性效果
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              slivers: [
//                //我们需要实现的 SliverFlexibleHeader 组件
//                SliverFlexibleHeader(
//                  visibleExtent: 200, // 初始状态在列表中占用的布局高度
//                  builder:LayoutBuilder(
//                      builder: (BuildContext context, BoxConstraints constraints) {
//                        return builder(
//                            context,
//                            constraints.maxHeight
//                        );
//                      },
                  // 为了能根据下拉状态变化来定制显示的布局，我们通过一个 builder 来动态构建布局。
//                  builder: (context, availableHeight, direction) {
//                    return GestureDetector(
//                      onTap: () => print('tap'), //测试是否可以响应事件
//                      child: Image(
//                        image: AssetImage("assets/hxq_icon_weixin_lanche2.png"),
//                        width: 50.0,
//                        height: availableHeight,
//                        alignment: Alignment.bottomCenter,
//                        fit: BoxFit.cover,
//                      ),
//                    );
//                  },
//                ),
              ],
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建列表项
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
