import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:tencent_kit/tencent_kit.dart';

class ShareInit{

  wxShareInIt(appId,universalLink){
    fluwx.registerWxApi(appId: appId, universalLink: universalLink).then((data) {
      print("微信注册：" + data.toString());
    });
  }

  qqShareInIt(appId) async {
    await Tencent.instance.registerApp(appId: appId);
    Tencent.instance.setIsPermissionGranted(granted: true);
  }

}