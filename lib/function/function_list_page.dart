import 'package:flutter/material.dart';
import 'package:flutter_app/function/template/json_serializable/json_serializable.dart';
import 'package:flutter_app/function/template/lifecycle/lifecycle_page.dart';

import 'template/future/future_page.dart';

/// 功能配置页面
class FunctionListPage extends StatelessWidget {
  const FunctionListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (_){return Scaffold(body: JsonSer());}));
          },child: Text("json serializable 调试"),
        ),
        TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (_){return LifeCyclePage();}));
        }, child: Text("生命周期测试")),
        TextButton(onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (_){return FutureWidget();}));
        }, child: Text("Future测试"))
      ],
    );
  }
}


