// lib/features/product/data/datasources/product_remote_ds.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProductById(String productId);
  Future<List<ProductModel>> getProductsBySeller(String sellerId);
  Future<List<ProductModel>> getFeaturedProducts();
  Future<void> toggleProductLike(String productId, String userId);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> toggleProductLike(String productId, String userId) async {
    final productDoc = await _firestore.collection('products').doc(productId).get();

    if (!productDoc.exists) {
      throw Exception('Product not found');
    }

    final List<dynamic> likes = productDoc.data()!['likes'];

    if (likes.contains(userId)) {
      await _firestore.collection('products').doc(productId).update({
        'likes': FieldValue.arrayRemove([userId]),
      });
    } else {
      await _firestore.collection('products').doc(productId).update({
        'likes': FieldValue.arrayUnion([userId]),
      });
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      // final user = FirebaseAuth.instance.currentUser;
      // if (user != null) {
      //   throw Exception("User is not authenticated. Please sign in.");
      // }
      QuerySnapshot snapshot =
          await _firestore.collection('products')
          .where('isAvailable', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<ProductModel> getProductById(String productId) async {
    final doc = await _firestore.collection('products').doc(productId).get();
    return ProductModel.fromFirestore(doc.data()!);
  }

  @override
  Future<List<ProductModel>> getProductsBySeller(String sellerId) async {
    final snapshot = await _firestore
        .collection('products')
        .where('sellerId', isEqualTo: sellerId)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromFirestore(doc.data()))
        .toList();
  }

  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    final snapshot = await _firestore
        .collection('products')
        .where('isFeatured', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => ProductModel.fromFirestore(doc.data()))
        .toList();
  }
}
