import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

main() {
  print("start");
  // 使用案例
  var future1 = Future(() {
    var ii = "asda";
    print("future 1 " + ii);
    return ii;
  }).then((value) {
    print("future 1 " + value);
  }).catchError((e) {
    print(e);
  }).onError((error, stackTrace) {
    print(stackTrace);
  }).whenComplete(() {
    print("whenComplete");
  });
  //这里只是延时加入，不是真正意义上的延时执行
  Future.delayed(Duration(milliseconds: 200), () {
    print("我是延迟的Future");
  });

  var future = Future.value(["我是Future", 1231]);
  //这个同步打印
  Future.sync(() => print("同步执行"));
  future.then((value) => print(value));
  var future2 = Future(() {
    var ii = "asda";
    print("future 2 " + ii);
    return ii;
  }).then((value) {
    print("future 2 " + value);
  });
  print("end");
  Future.microtask(() {
    print("执行微任务");
    return "";
  });
  Future.wait([
    Future(() => "等待执行任务1"),
    Future(() => "等待执行任务2"),
    Future(() => "等待执行任务3"),
  ]).then((value) => print(value));
}

class FutureWidget extends StatefulWidget {
  FutureWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FutureState();
  }
}

class FutureState extends State<FutureWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future"),
      ),
      body: Container(
          child: FutureBuilder<int>(
        initialData: 16,
        builder: (context, snap) {
          return Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Future",
                    style: TextStyle(fontSize: snap.data.toDouble()),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "点击",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          );
        },
        future: getFontSize(),
      )),
    );
  }

  int fontSize = 32;

  Future<int> getFontSize() async {
    return Future(() {
      sleep(Duration(seconds: 3));
      return ++fontSize;
    });
  }
}
