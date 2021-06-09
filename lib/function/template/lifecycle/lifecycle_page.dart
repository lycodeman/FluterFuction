import 'package:flutter/material.dart';
import 'package:flutter_app/function/template/ModelState.dart';

class LifeCyclePage extends StatefulWidget {
  LifeCyclePage({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return LifeCycleState();
  }
}

class LifeCycleState extends State<LifeCyclePage> with WidgetsBindingObserver{
  final List<int> itemCount = List.generate(50, (index) => index);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("LifeCycleState initState");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("LifeCycleState dispose");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LifeCycleState didChangeDependencies");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("LifeCycleState didChangeAppLifecycleState ${state.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    print("LifeCycleState build");
    return Scaffold(
      appBar: AppBar(title: Text("LifeCycle"),),
      body: StatefulBuilder(builder: (ctx,setState){
        return Stack(
          children: [
            ListView.builder(
                itemCount: itemCount.length,
                key: ValueKey(itemCount.length),
                itemBuilder: (ctx,index){
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        if(index/3==0) {
                          setState(() {
                            itemCount.remove(index);
                          });
                        }else {
                          Navigator.push(context,MaterialPageRoute(builder: (_){return LifeItemDetail(content: "Life item ${itemCount[index]}");}));
                        }
                      },
                      child: LifeItem(content: "Life item ${itemCount[index]}"),
                    ),
                  );
                })
          ]..add(Positioned(child: FloatingActionButton(
            onPressed: (){
              showDialog(context: ctx, builder: (ctx){
                return Text("Dialog");
              });
            },
            child: Text("Show Dialog!"),
          ))),
        );
      }),
    );
  }

}

class LifeItem extends StatefulWidget {
  final String content;
  LifeItem({Key key,this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LifeItemState(content: content);
  }
}

class LifeItemState extends State<LifeItem> with WidgetsBindingObserver{
  final String content;
  LifeItemState({this.content});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("LifeItemState initState $content");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("LifeItemState dispose $content");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LifeItemState didChangeDependencies $content");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("LifeItemState didChangeAppLifecycleState  $content ${state.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }

}

class LifeItemDetail extends StatefulWidget {
  final String content;
  LifeItemDetail({Key key,this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LifeItemDetailState(content: content);
  }
}

class LifeItemDetailState extends State<LifeItemDetail> with WidgetsBindingObserver{
  final String content;
  LifeItemDetailState({this.content});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("LifeItemDetailState initState $content");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("LifeItemDetailState dispose $content");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LifeItemDetailState didChangeDependencies $content");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // super.didChangeAppLifecycleState(state);
    print("LifeItemDetailState didChangeAppLifecycleState  $content ${state.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LifeItemDetail"),),
      body: Text(content),
    );
  }

}

