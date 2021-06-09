import 'package:flutter/cupertino.dart';

mixin UMMxUtils{
  void record(){}
  int ca = 0;
}
mixin CalMxUtils{
 void cal() {}
}

abstract class UMUtils{
    void record(){}
    int ca = 0;
}

abstract class CalUtils{
  void cal(){}
  // int aaa = 1;
  // void record(){}
}

class XXX extends UMUtils implements CalUtils{

  @override
  int ca = 0;

  @override
  void record() {
    super.record();
    ca = 9;
  }

  @override
  void cal() {
    // TODO: implement cal
  }

}
///type1
//  implements 中的方法和变量必须重写 mixin优先级高于extends, extends with 则不需要 实现
// mixin中的好处： 拓展了extends

class XXXX with CalMxUtils {


}
class XXXXX with CalMxUtils, UMMxUtils {
  @override
  int ca;

  @override
  void record() {
    // TODO: implement record
  }

}
/// type 2
class All {
  void test() {}
}

mixin F on All{

  void func() {
    test();
  }
}
// mixin Person {}
// mixin C {}
/// mixin 搭配 on使得 SSS必须继承All才能正常使用 同时在F中可以使用All中的方法
/// mixin：定义了组块。
// on：限定了使用mixin组块的宿主必须要继承于某个特定的类；在mixin中可以访问到该特定类的成员和方法。
// with：负责组合组块，而with后面跟的类并不一定需要是mixin的，abstract class和普通类都是可以的，这一点需要注意，例如下面这样：

class SSS extends All with F {

}

abstract class BindingBase{

  BindingBase(){
    // print("init base ");
  }

  initInstances() {
    print("init BindingBase ");
  }
}
mixin GestureBinding on BindingBase{
  @override
  initInstances() {
    print("init GestureBinding ");
    super.initInstances();

  }
}
mixin RendererBinding on BindingBase{

  @override
  initInstances() {
    print("init RendererBinding ");
    super.initInstances();

  }
}

class WidgetsFlutterBinding extends BindingBase with GestureBinding, RendererBinding  {

  static ensureInitialized() {
    WidgetsFlutterBinding().initInstances();
  }
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
}