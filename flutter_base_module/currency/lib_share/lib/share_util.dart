import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:tencent_kit/tencent_kit.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:io';

class ShareManager{


  shareToWeChatWebSession(path,title,content,imgPath,back){//微信分享web页面到好友
    fluwx.shareToWeChat(
        fluwx.WeChatShareWebPageModel(
            path,
            title: title,
            description: content,
            thumbnail: fluwx.WeChatImage.network(imgPath),
            scene: fluwx.WeChatScene.SESSION
        )
    ).then((data) {
      back(data);
    });
  }

  shareToWeChatWebTimeLine(path,title,content,imgPath,back){//微信分享web页面到朋友圈
    fluwx.shareToWeChat(
        fluwx.WeChatShareWebPageModel(
            path,
            title: title,
            description: content,
            thumbnail: fluwx.WeChatImage.network(imgPath),
            scene: fluwx.WeChatScene.TIMELINE
        )
    ).then((data) {
      back(data);
    });
  }

  shareToWeChatImageSession(String imgPath,back){//微信分享图片到好友
    fluwx.shareToWeChat(
        fluwx.WeChatShareImageModel(
          fluwx.WeChatImage.network(imgPath),
          thumbnail: fluwx.WeChatImage.network(imgPath),
          scene: fluwx.WeChatScene.SESSION,
          description: "image",
        )
    ).then((data) {
      back(data);
    });
  }

  shareToWeChatImageTimeLine(String imgPath,back){//微信分享图片到朋友圈
    fluwx.shareToWeChat(
        fluwx.WeChatShareImageModel(
          fluwx.WeChatImage.network(imgPath),
          thumbnail: fluwx.WeChatImage.network(imgPath),
          scene: fluwx.WeChatScene.TIMELINE,
          description: "image",
        )
    ).then((data) {
      back(data);
    });
  }

  shareToWeChatMiniProgramSession(wxShareWebPageUrl,wxShareUserName,title,content,imageUrl,path,back){//微信分享好友小程序
    fluwx.shareToWeChat(
        fluwx.WeChatShareMiniProgramModel(
          webPageUrl: wxShareWebPageUrl,
          userName: wxShareUserName,
//                                                      miniProgramType: WeChatShareMiniProgramModel.MINI_PROGRAM_TYPE_RELEASE,
          title: title,
          description: content,
          thumbnail: fluwx.WeChatImage.network(imageUrl),
//          path:AppConfig.getWxSharePath(3, widget.id,pid),
          path:path,
        )
    ).then((data) {
      back(data);
    });
  }

  shareToQQUrl(title,url,back,notFindInstalled) async{//QQ分享链接
    bool isQQInstalled = await Tencent.instance.isQQInstalled();
    if(isQQInstalled){
      Tencent.instance.shareWebpage(
          scene: TencentScene.SCENE_QQ,
          title: title,
          targetUrl: url);
      back();
    }else{
      notFindInstalled();
    }
  }

  shareToQQImg(title,url,back,notFindInstalled) async{//QQ分享图片
    bool isQQInstalled = await Tencent.instance.isQQInstalled();
    if(isQQInstalled){
      File file = await DefaultCacheManager().getSingleFile(url);
      Tencent.instance.shareImage(
          scene: TencentScene.SCENE_QQ,
          imageUri: Uri.file(file.path));
      back();
    }else{
      notFindInstalled();
    }
  }

  shareToQQZone(title,url,back,notFindInstalled) async{//QQ空间分享链接
    bool isQQInstalled = await Tencent.instance.isQQInstalled();
    if(isQQInstalled){
      Tencent.instance.shareWebpage(
          scene: TencentScene.SCENE_QZONE,
          title: title,
          targetUrl: url);
      back();
    }else{
      notFindInstalled();
    }
  }

}
