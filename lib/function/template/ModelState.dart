import 'package:flutter/material.dart';

typedef BuildWidget = Widget Function(BuildContext context);

class ModelState<T extends StatefulWidget> extends State<T>{
  BuildWidget buildWidget;
  ModelState(this.buildWidget);
  @override
  Widget build(BuildContext context) {
    return buildWidget(context);
  }
}

mixin ModelState2 <T extends StatefulWidget> implements State<T>{

}

