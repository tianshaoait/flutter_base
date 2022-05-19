//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanManager{

//  Instance(success,fail) async{
//     try {
//       // 此处为扫码结果，barcode为二维码的内容
//       String barcode = await BarcodeScanner.scan();
//       print('扫码结果: ' + barcode);
////      barcode = releaseHttpBase + '?type=1&id=1&pid=1';
////       getScanInfo(context, barcode);
//       success(barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         // 未授予APP相机权限
//         print('未授予APP相机权限');
////         JhToast.showError(context, msg: '未授予APP相机权限');
//         fail('未授予APP相机权限');
//       } else {
//         // 扫码错误
//         print('扫码错误: $e');
////         JhToast.showError(context, msg: '扫码错误');
//         fail('扫码错误');
//       }
//     } on FormatException {
//       // 进入扫码页面后未扫码就返回
//       print('进入扫码页面后未扫码就返回');
//     } catch (e) {
//       // 扫码错误
//       print('扫码错误: $e');
////       JhToast.showError(context, msg: '扫码错误');
//       fail('扫码错误');
//     }
//   }

}