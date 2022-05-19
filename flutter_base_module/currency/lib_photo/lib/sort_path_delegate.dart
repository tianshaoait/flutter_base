///
/// [Author] Alex (https://github.com/Alex525)
/// [Date] 2020-05-30 13:08
///
import 'package:photo_manager/photo_manager.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// Delegate to sort asset path entities.
/// 用于资源路径排序的实现
///
/// Define [sort] to sort the asset path list. Usually integrate with [List.sort].
/// 通过定义 [sort] 方法对资源路径列表进行排序。通常使用 [List.sort]。
abstract class MySortPathDelegate extends SortPathDelegate{
  const MySortPathDelegate();

  void sort(List<AssetPathEntity> list);

  static const MySortPathDelegate common = CommonSortPathDelegate();
}

/// Common sort path delegate.
/// 常用的路径排序实现
///
/// This delegate will bring "Recent" (All photos), "Camera", "Screenshot(?s)"
/// to the front of the paths list.
/// 该实现会把“最近”、“相机”、“截图”排到列表头部。
class CommonSortPathDelegate extends MySortPathDelegate {
  const CommonSortPathDelegate();

  @override
  void sort(List<AssetPathEntity> list) {
    list.sort((AssetPathEntity path1, AssetPathEntity path2) {
      if(path1.name == 'Recent' || path1.name == 'Recents'){
        path1.name = '最近';
      }
      if(path2.name == 'Recent' || path2.name == 'Recents'){
        path2.name = '最近';
      }
      if(path1.name == 'Screenshot' || path1.name == 'Screenshots'){
        path1.name = '截图';
      }
      if(path2.name == 'Screenshot' || path2.name == 'Screenshots'){
        path2.name = '截图';
      }
      if(path1.name == 'Camera'){
        path1.name = '相机';
      }
      if(path2.name == 'Camera'){
        path2.name = '相机';
      }
      if(path1.name == 'Download'){
        path1.name = '下载';
      }
      if(path2.name == 'Download'){
        path2.name = '下载';
      }

      if (path1.isAll) {
        return -1;
      }
      if (path2.isAll) {
        return 1;
      }
      if (_isCamera(path1)) {
        return -1;
      }
      if (_isCamera(path2)) {
        return 1;
      }
      if (_isScreenShot(path1)) {
        return -1;
      }
      if (_isScreenShot(path2)) {
        return 1;
      }
      return otherSort(path1, path2);
    });
  }

  int otherSort(AssetPathEntity path1, AssetPathEntity path2) {
    return path1.name.compareTo(path2.name);
  }

  bool _isCamera(AssetPathEntity entity) {
    return entity.name.toUpperCase() == 'camera'.toUpperCase();
  }

  bool _isScreenShot(AssetPathEntity entity) {
    return entity.name.toUpperCase() == 'screenshots'.toUpperCase() ||
        entity.name.toUpperCase() == 'screenshot'.toUpperCase();
  }

}
