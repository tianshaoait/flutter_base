//import 'dart:io';
//
//import 'package:amap_flutter_location/amap_flutter_location.dart';
//import 'package:amap_flutter_location/amap_location_option.dart';
//
//class aMapUtils{
//
//  AMapFlutterLocation _locationPlugin = new AMapFlutterLocation();
//
//   void aMapInit(android_key,ios_key){
//     AMapFlutterLocation.setApiKey(android_key, ios_key);
//   }
//
//   void aMapLocationInit(){
//     if (Platform.isIOS) {
//       _requestAccuracyAuthorization();
//     }
//
//
//     _locationPlugin.onLocationChanged().listen((Map<String, Object> result) {
//       print('注册定位结果监听:${result.toString()}');
//       _locationPlugin.stopLocation();
//     });
//
//   }
//
//   void getLocation(){
//     PermissionUtils.getPermission(Permission.location, () {
//       _setLocationOption();
//       _locationPlugin.startLocation();
//     }, () {
//       print('未取得定位权限');
//       print("极光 app.isPhoneOneKey:${app.isPhoneOneKey}");
//       print("极光 app.isPhoneOneKeyToken:${app.isPhoneOneKeyToken}");
//       _goHome();
//     });
//
//   }
//
//   void _requestAccuracyAuthorization() async {
//     AMapAccuracyAuthorization currentAccuracyAuthorization = await _locationPlugin.getSystemAccuracyAuthorization();
//     if (currentAccuracyAuthorization == AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
//       print("精确定位类型");
//     } else if (currentAccuracyAuthorization == AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
//       print("模糊定位类型");
//     } else {
//       print("未知定位类型");
//     }
//   }
//
//}
