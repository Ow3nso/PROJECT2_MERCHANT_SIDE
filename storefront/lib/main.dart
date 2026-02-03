import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:storefront/src/features/cart/presentation/adapters/cart_controller.dart';
import 'package:storefront/src/features/products/presentation/ui/pages/get_products.dart';
import 'package:storefront/src/core/utils/routes_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storefront/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:storefront/src/features/products/data/repository/product_repo_impl.dart';
import 'package:storefront/src/features/products/data/datasources/product_remote_ds.dart';
import 'package:storefront/src/features/products/domain/usecases/get_products.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add the CartProvider
        ChangeNotifierProvider(create: (_) => CartProvider()),

        // Add the ProductBloc
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(
            getProducts: GetProducts(
              ProductRepositoryImpl(
                remoteDataSource: ProductRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),

        // Add the ProductRepositoryImpl provider
        Provider<ProductRepositoryImpl>(
          create: (_) => ProductRepositoryImpl(
            remoteDataSource: ProductRemoteDataSourceImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: GetProductsPage(),
      ),
    );
  }
}