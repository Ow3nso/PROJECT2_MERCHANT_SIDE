// lib/features/product/domain/repositories/product_repository.dart
import 'package:dartz/dartz.dart';

import 'package:storefront/src/core/errors/failure.dart';

import '../entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, void>> toggleProductLike(String productId, String userId);
  
  // Basic CRUD
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity>> getProductById(String productId);
  Future<Either<Failure, List<ProductEntity>>> getProductsBySeller(String sellerId);
  
  // Filtering
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(String category);
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts();
  Future<Either<Failure, List<ProductEntity>>> getDiscountedProducts();
  
  // Status-based
  Future<Either<Failure, List<ProductEntity>>> getNewArrivals();
  Future<Either<Failure, List<ProductEntity>>> getTrendingProducts();
  
  // Inventory
  Future<Either<Failure, int>> getProductStock(String productId);
  Future<Either<Failure, void>> updateStock(String productId, int newStock);
  
  // Analytics
  Future<Either<Failure, void>> recordProductView(String productId);
  Future<Either<Failure, void>> recordProductShare(String productId);
}