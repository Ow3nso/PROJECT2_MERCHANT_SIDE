// lib/features/product/domain/usecases/get_product_by_id.dart
import 'package:dartz/dartz.dart';

import 'package:storefront/src/core/errors/failure.dart';

import '../repositories/product_repository.dart';
import '../entities/product_entity.dart';

class GetProductById {
  final ProductRepository repository;

  GetProductById(this.repository);

  Future<Either<Failure, ProductEntity>> call(String productId) async {
    return await repository.getProductById(productId);
  }
}