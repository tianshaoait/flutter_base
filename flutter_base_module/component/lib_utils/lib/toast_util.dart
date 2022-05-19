import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil{

  show(backgroundColor,textColor,fontSize,msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize
    );
  }

  showCloseTime(backgroundColor,textColor,fontSize,int time,msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: time,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize
    );
  }

}