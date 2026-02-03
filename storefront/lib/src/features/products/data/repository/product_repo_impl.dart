// lib/features/product/data/repositories/product_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:storefront/src/core/errors/failure.dart';

import '../datasources/product_remote_ds.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
Future<Either<Failure, void>> toggleProductLike(String productId, String userId) async {
  try {
    // Get the current product document
    final productDoc = await FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .get();

    if (!productDoc.exists) {
      return Left(Failure(message: 'Product not found'));
    }

    // Get the current likes array
    final List<dynamic> likes = productDoc.data()!['likes'];

    // Check if the user has already liked the product
    if (likes.contains(userId)) {
      // Remove the like
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({
        'likes': FieldValue.arrayRemove([userId]),
      });
    } else {
      // Add the like
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .update({
        'likes': FieldValue.arrayUnion([userId]),
      });
    }

    return const Right(null); // Success
  } on FirebaseException catch (e) {
    return Left(Failure(message: 'Firestore Error: ${e.message}'));
  } catch (e) {
    return Left(Failure(message: 'Unexpected Error: ${e.toString()}'));
  }
}

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final products = await remoteDataSource.getAllProducts();
      return Right(products.map((model) => model.toEntity()).toList());
    } on FirebaseException catch (e) {
      return Left(Failure(message: 'Firestore Error: ${e.message}'));
    } catch (e) {
      return Left(Failure(message: 'Unexpected Error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(String productId) async {
    try {
      final product = await remoteDataSource.getProductById(productId);
      return Right(product.toEntity());
    } on FirebaseException catch (e) {
      return Left(Failure(message: 'Product Not Found: ${e.message}'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsBySeller(
      String sellerId) async {
    try {
      final products = await remoteDataSource.getProductsBySeller(sellerId);
      return Right(products.map((model) => model.toEntity()).toList());
    } on FirebaseException catch (e) {
      return Left(Failure(message: 'Query Failed: ${e.message}'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts() async {
    try {
      final products = await remoteDataSource.getFeaturedProducts();
      return Right(products.map((model) => model.toEntity()).toList());
    } on FirebaseException catch (e) {
      return Left(Failure(message: 'Featured Products Error: ${e.message}'));
    }
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getDiscountedProducts() {
    // TODO: implement getDiscountedProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getNewArrivals() {
    // TODO: implement getNewArrivals
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, int>> getProductStock(String productId) {
    // TODO: implement getProductStock
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String category) {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts() {
    // TODO: implement getTrendingProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> recordProductShare(String productId) {
    // TODO: implement recordProductShare
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> recordProductView(String productId) {
    // TODO: implement recordProductView
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, void>> updateStock(String productId, int newStock) {
    // TODO: implement updateStock
    throw UnimplementedError();
  }
}
