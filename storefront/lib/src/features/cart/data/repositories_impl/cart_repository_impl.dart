// import '../../../../core/errors/failure.dart';


// import '../../domain/entities/entity_cart.dart';
// import '../../domain/repositories/cart_repository.dart';
// import '../data_sources/cart_data_source.dart';

// /// A class that implements [CartRepository].
// ///
// /// The class is named [CartRepositoryImpl] and contains
// /// one method for each usecase in [usecases].
// ///
// /// Each method has the same name as the usecase and takes as arguments the
// /// attributes of the usecase. The return type of the method is [Future] or
// /// [Stream] depending on the value of [usecaseTypes[usecase]].
// class CartRepositoryImpl implements CartRepository {

//   final CartDataSource dataSource;
//   const CartRepositoryImpl(this.dataSource);

//   /// Implements [CartRepository.addProductToCart].
//   ///
//   /// The method calls [CartDataSource.addProductToCart]
//   /// and returns the result as a tuple of [Failure] and [EntityCart].
//   ///
//   /// The method is marked as [override] and should be implemented by the user.
//   @override
//   Future<(Failure?, EntityCart?)> addProductToCart({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed }) async {
//     try {
//       final result = await dataSource.addProductToCart(id: id, createdAt: createdAt, sellerId: sellerId, label: label, description: description, price: price, currency: currency, category: category, subCategory: subCategory, images: images, isAvailable: isAvailable, isFeatured: isFeatured, isPopular: isPopular, isOnSale: isOnSale, isOnDiscount: isOnDiscount, isOnNew: isOnNew, isOnBestSeller: isOnBestSeller, isOnTopRated: isOnTopRated, isOnTrending: isOnTrending, likes: likes, views: views, shares: shares, isVerified: isVerified, isApproved: isApproved, isSoldOut: isSoldOut, stock: stock, discountPercentage: discountPercentage, discountAmount: discountAmount, discountStartDate: discountStartDate, discountEndDate: discountEndDate, availableColors: availableColors, availableSizes: availableSizes, shopId: shopId, lastUpdatedAt: lastUpdatedAt, hasBeenIndexed: hasBeenIndexed);
//       return (null, result?.toEntity());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// Implements [CartRepository.getAllCartProducts].
//   ///
//   /// The method calls [CartDataSource.getAllCartProducts]
//   /// and returns the result as a tuple of [Failure] and [EntityCart].
//   ///
//   /// The method is marked as [override] and should be implemented by the user.
//   @override
//   Future<(Failure?, EntityCart?)> getAllCartProducts({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed }) async {
//     try {
//       final result = await dataSource.getAllCartProducts(id: id, createdAt: createdAt, sellerId: sellerId, label: label, description: description, price: price, currency: currency, category: category, subCategory: subCategory, images: images, isAvailable: isAvailable, isFeatured: isFeatured, isPopular: isPopular, isOnSale: isOnSale, isOnDiscount: isOnDiscount, isOnNew: isOnNew, isOnBestSeller: isOnBestSeller, isOnTopRated: isOnTopRated, isOnTrending: isOnTrending, likes: likes, views: views, shares: shares, isVerified: isVerified, isApproved: isApproved, isSoldOut: isSoldOut, stock: stock, discountPercentage: discountPercentage, discountAmount: discountAmount, discountStartDate: discountStartDate, discountEndDate: discountEndDate, availableColors: availableColors, availableSizes: availableSizes, shopId: shopId, lastUpdatedAt: lastUpdatedAt, hasBeenIndexed: hasBeenIndexed);
//       return (null, result?.toEntity());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   /// Implements [CartRepository.removeProductFromCart].
//   ///
//   /// The method calls [CartDataSource.removeProductFromCart]
//   /// and returns the result as a tuple of [Failure] and [EntityCart].
//   ///
//   /// The method is marked as [override] and should be implemented by the user.
//   @override
//   Future<(Failure?, EntityCart?)> removeProductFromCart({ required dynamic id, required dynamic createdAt, required dynamic sellerId, required dynamic label, required dynamic description, required dynamic price, required dynamic currency, required dynamic category, required dynamic subCategory, required dynamic images, required dynamic isAvailable, required dynamic isFeatured, required dynamic isPopular, required dynamic isOnSale, required dynamic isOnDiscount, required dynamic isOnNew, required dynamic isOnBestSeller, required dynamic isOnTopRated, required dynamic isOnTrending, required dynamic likes, required dynamic views, required dynamic shares, required dynamic isVerified, required dynamic isApproved, required dynamic isSoldOut, required dynamic stock, required dynamic discountPercentage, required dynamic discountAmount, required dynamic discountStartDate, required dynamic discountEndDate, required dynamic availableColors, required dynamic availableSizes, required dynamic shopId, required dynamic lastUpdatedAt, required dynamic hasBeenIndexed }) async {
//     try {
//       final result = await dataSource.removeProductFromCart(id: id, createdAt: createdAt, sellerId: sellerId, label: label, description: description, price: price, currency: currency, category: category, subCategory: subCategory, images: images, isAvailable: isAvailable, isFeatured: isFeatured, isPopular: isPopular, isOnSale: isOnSale, isOnDiscount: isOnDiscount, isOnNew: isOnNew, isOnBestSeller: isOnBestSeller, isOnTopRated: isOnTopRated, isOnTrending: isOnTrending, likes: likes, views: views, shares: shares, isVerified: isVerified, isApproved: isApproved, isSoldOut: isSoldOut, stock: stock, discountPercentage: discountPercentage, discountAmount: discountAmount, discountStartDate: discountStartDate, discountEndDate: discountEndDate, availableColors: availableColors, availableSizes: availableSizes, shopId: shopId, lastUpdatedAt: lastUpdatedAt, hasBeenIndexed: hasBeenIndexed);
//       return (null, result?.toEntity());
//     } catch (e) {
//       rethrow;
//     }
//   }


// }
