import 'package:flutter/material.dart';

void main() {
  runApp(SliverFlexibleHeaderDemo2());
}

class SliverFlexibleHeaderDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(),
    );
  }
}

typedef SliverFlexibleHeaderBuilder = Widget Function(
  BuildContext context,
  double maxExtent,
  //ScrollDirection direction,
);

class SliverFlexibleHeader extends StatelessWidget {
  const SliverFlexibleHeader({
    Key? key,
    this.visibleExtent = 0,
    required this.builder,
  }) : super(key: key);

  final SliverFlexibleHeaderBuilder builder;
  final double visibleExtent;

  @override
  Widget build(BuildContext context) {
    return SliverFlexibleHeader(
      visibleExtent: visibleExtent,
      builder: (BuildContext context, double maxExtent) {
        return builder(context, maxExtent);
      },
    );
  }
}
