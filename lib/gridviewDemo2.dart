import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GridViewActivity());
}

class GridViewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _GridView(),
    );
  }
}

class _GridView extends StatefulWidget {
  @override
  _GridViewState createState() => new _GridViewState();
}

class _GridViewState extends State<_GridView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(title: Text("商品列表")),
          Expanded(
            child: GridView.extent(
              maxCrossAxisExtent: 120.0,
              childAspectRatio: 2.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            ),
//等价上面
//            GridView(
//              padding: EdgeInsets.zero,
//              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                  maxCrossAxisExtent: 180.0,
//                  childAspectRatio: 2.0 //宽高比为2
//              ),
//              children: <Widget>[
//                Icon(Icons.ac_unit),
//                Icon(Icons.airport_shuttle),
//                Icon(Icons.all_inclusive),
//                Icon(Icons.beach_access),
//                Icon(Icons.cake),
//                Icon(Icons.free_breakfast),
//              ],
//            ),

//跟上面一样
//            GridView(
//                //横轴为固定数量子元素的layout算法
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                    crossAxisCount: 3, //横轴三个子widget
//                    childAspectRatio: 1.0 //宽高比为1时，子widget
//                    ),
//                children: <Widget>[
//                  Icon(Icons.ac_unit),
//                  Icon(Icons.airport_shuttle),
//                  Icon(Icons.all_inclusive),
//                  Icon(Icons.beach_access),
//                  Icon(Icons.cake),
//                  Icon(Icons.free_breakfast)
//                ]),
          )
        ],
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}
