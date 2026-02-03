import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/date/date_utils.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

import 'fields.dart';

part 'shop_collection.freezed.dart';
part 'shop_collection.g.dart';

@freezed
class ShopCollection with _$ShopCollection, DateUtils{
   @JsonSerializable(explicitToJson: true)

   factory ShopCollection({
     String? id,
     @JsonKey(name: ShopCollectionFields.createdAt, fromJson: DateUtils.timestampToDateTime, toJson: DateUtils.dateTimeToTimestamp)
         DateTime? createdAt,
     @JsonKey(name: ShopCollectionFields.shopId) String? shopId,
     @JsonKey(name: ShopCollectionFields.name) String? name,
     @JsonKey(name: ShopCollectionFields.userId) String? userId,
     @JsonKey(name: ShopCollectionFields.docId) String? docId,
     @JsonKey(name: ShopCollectionFields.productIds) List<String>? productIds,
     @JsonKey(name: ShopCollectionFields.isPublic) bool? isPublic,
     @JsonKey(name: ShopCollectionFields.updatedAt) int? updatedAt,
      @JsonKey(name: ShopCollectionFields.views) int? views,
     @JsonKey(name: ShopCollectionFields.link) String? link,
   }) = _ShopCollection;

    factory ShopCollection.fromJson(Map<String, dynamic> json) => _$ShopCollectionFromJson(json);
    factory ShopCollection.fromDS(String id, Map<String, dynamic> json) =>
        ShopCollection.fromJson(json);
    
    factory ShopCollection.empty() => ShopCollection(
          id: '',
          createdAt: DateTime.now(),
          shopId: '',
          name: '',
          userId: '',
          docId: '',
          productIds: [],
          isPublic: false,
          updatedAt: DateTime.now().millisecondsSinceEpoch,
          views: 0,
          link: '',
        );

}
