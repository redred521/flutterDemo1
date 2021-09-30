import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ListViewActivity());
}

var dateList = [];

class ListViewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    dateList.clear();
    dateList.add(1);
    dateList.add(2);
    dateList.add(3);
    dateList.add(4);
    dateList.add(5);
    return _InfiniteListView();
  }
}

class _ListView extends StatefulWidget {
  _ListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListViewState3();
  }
}

class _ListViewState extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 50,
            color: Colors.amber,
            child: Text("这是第一列数据"),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.deepOrange,
            child: Text("这是第二列数据"),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.green,
            child: Text("这是第三列数据"),
          )
        ],
      ),
    );
  }
}

class _ListViewState2 extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.green,
            child: Text("这是第${dateList[index]}列数据"),
          );
        },
      ),
    );
  }
}

class _ListViewState3 extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.green,
            child: Text("这是第${dateList[index]}列数据"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.deepOrange,
          );
        },
      ),
    );
  }
}

class _InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<_InfiniteListView> {
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
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: _words.length,
              itemBuilder: (context, index) {
                //如果到了表尾
                if (_words[index] == loadingTag) {
                  //不足100条，继续获取数据
                  if (_words.length - 1 < 100) {
                    //获取数据
                    _retrieveData();
                    //加载时显示loading
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0)),
                    );
                  } else {
                    //已经加载了100条数据，不再获取数据。
                    return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "没有更多了",
                          style: TextStyle(color: Colors.grey),
                        ));
                  }
                }
                //显示单词列表项
                return ListTile(title: Text(_words[index]));
              },
              separatorBuilder: (context, index) => Divider(height: .0),
            ),
          ),
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
