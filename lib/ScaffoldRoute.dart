import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: ScaffoldRoute(),
    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({Key? key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;
  List tabs = ["新闻", "历史", "图片"];
  late TabController _controller;

//  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _pageController = PageController();
//    _pageController.addListener(() {
//      _controller.index = _pageController.page as int;
//
//    });
    _controller = TabController(length: tabs.length, vsync: this);
    _controller.addListener(() {
//      _pageController.jumpToPage(_controller.index);
      switch (_controller.index) {
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
            onPressed: () {
              // 打开抽屉菜单
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(icon: Icon(Icons.build), onPressed: () {}),
          IconButton(icon: Icon(Icons.print), onPressed: () {}),
          IconButton(icon: Icon(Icons.clear), onPressed: () {}),
        ],
        bottom: TabBar(
          tabs: tabs.map((e) => Tab(text: e)).toList(),
          controller: _controller,
        ),
      ),
//      drawer: new Drawer(
//        child: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              Container(
//                color: Colors.black,
//                //注意
//                //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
//                child: new Transform(
//                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
//                  child: new Container(
//                    padding: const EdgeInsets.all(8.0),
//                    color: Colors.deepOrange,
//                    child: const Text('Apartment for rent!'),
//                  ),
//                ),
//              ),
//              Container(
//                color: Colors.deepPurpleAccent,
//                child: new Transform(
//                  alignment: Alignment.topLeft, //相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.0), //沿Y轴倾斜0.3弧度
//                  child: DecoratedBox(
//                    decoration: BoxDecoration(color: Colors.red),
//                    //默认原点为左上角，左移20像素，向上平移5像素
//                    child: Transform.translate(
//                      offset: Offset(-20.0, -5.0),
//                      child: Text("Hello world"),
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                color: Colors.deepPurpleAccent,
//                child: new Transform(
//                  alignment: Alignment.topLeft, //相对于坐标系原点的对齐方式
//                  transform: new Matrix4.skewY(0.0), //沿Y轴倾斜0.3弧度
//                  child: DecoratedBox(
//                    decoration: BoxDecoration(color: Colors.red),
//                    child: Transform.rotate(
//                      //旋转90度
//                      angle: math.pi / 2,
//                      child: Text("Hello world"),
//                    ),
//                  ),
//                ),
//              ),
//              DecoratedBox(
//                  decoration: BoxDecoration(color: Colors.red),
//                  child: Transform.scale(
//                      scale: 1.5, //放大到1.5倍
//                      child: Text("Hello world"))),
//              Row(
//                //注意
//                //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  DecoratedBox(
//                      decoration: BoxDecoration(color: Colors.red),
//                      child: Transform.scale(
//                          scale: 1.5, child: Text("Hello world"))),
//                  Text(
//                    "你好",
//                    style: TextStyle(color: Colors.green, fontSize: 18.0),
//                  )
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  DecoratedBox(
//                    decoration: BoxDecoration(color: Colors.red),
//                    //将Transform.rotate换成RotatedBox
//                    // RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
//                    child: RotatedBox(
//                      quarterTurns: 1, //旋转90度(1/4圈)
//                      child: Text("Hello world"),
//                    ),
//                  ),
//                  Text(
//                    "你好",
//                    style: TextStyle(color: Colors.green, fontSize: 18.0),
//                  )
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
      drawer: MyDrawer(),
      //抽屉
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
//      body: PageView(
////        controller: _pageController,
////        children: tabs.map((e) {
////          //创建3个Tab页
////          return Container(
////            alignment: Alignment.center,
////            child: Text(e, textScaleFactor: 5),
////          );
////        }).toList(),
////      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/ic_launcher.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
