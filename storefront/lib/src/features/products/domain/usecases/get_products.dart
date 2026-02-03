// lib/features/product/domain/usecases/get_products.dart
import 'package:dartz/dartz.dart';

import 'package:storefront/src/core/errors/failure.dart';

import '../repositories/product_repository.dart';
import '../entities/product_entity.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await repository.getAllProducts();
  }
}