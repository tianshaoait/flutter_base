import 'package:janalytics/janalytics.dart';

class JanalyticsManager{

  static Janalytics init(appKey,channel){// 初始化sdk
    Janalytics janalytics = Janalytics();
    janalytics.setup(appKey: appKey, channel: channel);
    janalytics.setDebugMode(true);
    return janalytics;
  }


}