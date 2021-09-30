import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var dateList = [];

void main() {
  runApp(ListViewActivity());
}

class ListViewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    dateList.clear();
    dateList.add(1);
    dateList.add(2);
    dateList.add(3);
    dateList.add(4);
    dateList.add(5);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _ListView(),
    );
    ;
  }
}

class _ListView extends StatefulWidget {
  _ListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

Future<String> getImage() async {
  return await rootBundle.loadString("assets/ic_launcher.png");
}

class _ListViewState extends State<_ListView> {
  @override
  Widget build(BuildContext context) {
    Future<String> getImage2() async {
      return await DefaultAssetBundle.of(context)
          .loadString('assets/hxq_icon_weixin_lanche2.png');
    }

    return Scaffold(
      body: ListView(
        children: <Widget>[
          new DecoratedBox(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage('assets/hxq_icon_weixin_lanche2.png'),
                ),
                color: Colors.deepPurpleAccent,
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                height: 50,
                color: Colors.cyanAccent,
                child: Image.asset(getImage2().toString(),height: 40,width: 40,),
              )),
          Image.asset(getImage2().toString(),height: 40,width: 40,),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            height: 50,
            color: Colors.amber,
//            child: Image.asset(getImage2().toString()),
            child: Image(image: AssetImage('assets/ic_launcher.png')),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.deepOrange,
//            child: Image.asset(getImage().toString()),
            child: Image(image: AssetImage('assets/hxq_icon_weixin_lanche2.png')),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            height: 50,
            color: Colors.green,
            child: Image(image: AssetImage('assets/hxq_logo_weixin.png')),
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
