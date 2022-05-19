
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtil{

  static loadingInit(scaleFactor){
    return EasyLoading.init(
        builder:(context, widget) {
          return MediaQuery(
            //设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(textScaleFactor: scaleFactor),
//            child: widget,
            child:widget,
          );
        }
    );
  }

  static setInstance(){
    EasyLoading.instance.userInteractions = false;//取消弹框显示后背景点击事件
  }

  static showLoading(String showContent){
    EasyLoading.show(status: showContent);
  }

  static closeLoading(){
    EasyLoading.dismiss();
  }

}