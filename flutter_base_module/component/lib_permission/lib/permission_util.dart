import 'package:permission_handler/permission_handler.dart';

class PermissionUtils{

  static getPermission(Permission permission,success,fail) async{
    var status = await permission.request();
    if (status.isGranted) {
      success();
    }else{
      fail();
    }
  }

}
