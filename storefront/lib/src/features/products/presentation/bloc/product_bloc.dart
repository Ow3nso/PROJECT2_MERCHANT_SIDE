// features/product/presentation/bloc/product_bloc.dart
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storefront/src/features/products/domain/entities/product_entity.dart';
import 'package:storefront/src/features/products/domain/usecases/get_products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc({required this.getProducts}) : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final result = await getProducts();
      result.fold(
        (failure) => emit(ProductError(message: failure.message)),
        (products) => emit(ProductLoaded(products: products)),
      );
    } catch (e) {
      emit(ProductError(message: 'Unexpected error: $e'));
    }
  }
}