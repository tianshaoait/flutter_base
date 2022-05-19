import 'package:jverify/jverify.dart';

class JverifyLoginUtils{

 static Jverify init(appKey,channel){
   Jverify jverify = new Jverify();
   jverify.setup(
       appKey: appKey,
       channel: channel
   ); // 初始化sdk,  appKey 和 channel 只对ios设置有效
   jverify.setDebugMode(true);
   return jverify;
  }



}