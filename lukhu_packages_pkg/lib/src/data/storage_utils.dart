
import 'data_constants.dart';

class StorageUtils {
  static String productMedia = 'product-media';
  // Generate a unique storage path from the given fields
  static String storagePath(String path, String pathType, String filename) {
    return '${AppDBConstants.usersStorageBucket}/$pathType/$path/$filename';
  }

  static String storagePathFromUrl(String url) {
    var path = url.split('/').last;
    return '${AppDBConstants.usersStorageBucket}/$path';
  }

  static String getProductMediaFolder(
      {required String productId, required String userStorageDir}) {
    return '${AppDBConstants.usersStorageBucket}/$productMedia/$userStorageDir/$productId';
  }

    static String shopCollectionsPath(String shopId) {
    return '${AppDBConstants.shopCollection}/$shopId/${AppDBConstants.collectionsCollection}';
  }
}
