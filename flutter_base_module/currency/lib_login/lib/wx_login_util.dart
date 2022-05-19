import 'dart:async';

import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:fluwx/fluwx.dart';

class WxLoginUtils{


  static Future<bool> init()async {
      var result = await isWeChatInstalled;
      print("is installed $result");
      return result;
    }




}