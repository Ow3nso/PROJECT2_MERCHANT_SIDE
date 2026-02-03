import '../../../../core/errors/failure.dart';

/// An abstract class that represents a repository for the feature [Cart].
///
/// The class contains one abstract method for each usecase in [usecases].
///
/// Each method has the same name as the usecase and takes as arguments the
/// attributes of the usecase. The return type of the method is [Future] or
/// [Stream] depending on the value of [usecaseTypes[usecase]].
///
/// The generated class is a valid implementation of
/// [CartRepository] and can be used as a
/// starting point for implementing the repository for the feature.

import '../entities/entity_cart.dart';

abstract class CartRepository {

  Future<(Failure?, EntityCart?)> addProductToCart({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed });
  Future<(Failure?, EntityCart?)> getAllCartProducts({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed });
  Future<(Failure?, EntityCart?)> removeProductFromCart({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed });

}
