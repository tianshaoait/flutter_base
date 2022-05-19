import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class cacheImage extends StatefulWidget {
  cacheImage({Key key,@required this.url,this.fit,this.width,this.height,this.animatedSwitcher});
String url;
BoxFit fit;
double width;
double height;
StatefulWidget animatedSwitcher;

@override
_ShowNetWorkImageState createState() {
  return _ShowNetWorkImageState();
}

}


class _ShowNetWorkImageState extends State<cacheImage> {

  _ShowNetWorkImageState();

  @override
  Widget build(BuildContext context) {
    if(widget.width == null){
      if(widget.url == null){
//        return Image(
//          image: new NetworkImage(""),
//        );
        return widget.animatedSwitcher;
      }else{
        return CachedNetworkImage(
          key: new ValueKey<String>(widget.url),
          fit: widget.fit == null ? BoxFit.cover : widget.fit,
          imageUrl: widget.url,
          placeholder: (context, url){
            return widget.animatedSwitcher;
          },
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }
    }else{
      if(widget.url == null){
        return widget.animatedSwitcher;
      }else{
        return CachedNetworkImage(
          key: new ValueKey<String>(widget.url),
          fit: widget.fit,
          width:widget.width,
          height:widget.height,
          imageUrl: widget.url,
//          placeholder: (context, url) => CircularProgressIndicator(),
          placeholder: (context, url){
            return widget.animatedSwitcher;
          },
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }
    }

  }



}