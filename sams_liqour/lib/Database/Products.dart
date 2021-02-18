import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:async';
import '../Models/Product.dart';

class ProductsServices {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "products";

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> searchProducts({String productName}) {
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }

  Future<List<ProductModel>> getProductsOfCategory({String category}) async =>
      _firestore
          .collection(collection)
          .where("Category", isEqualTo: 'Beers')
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> getProductsOfCategory1({String category}) async =>
      _firestore
          .collection(collection)
          .where("Category", isEqualTo: 'Spirits')
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> getProductsOfCategory2({String category}) async =>
      _firestore
          .collection(collection)
          .where("Category", isEqualTo: 'Wines')
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> getProductsOfCategory3({String category}) async =>
      _firestore
          .collection(collection)
          .where("Category", isEqualTo: 'Soft Drinks')
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> getFeaturedProducts({String featured}) async =>
      _firestore
          .collection(collection)
          .where("Featured", isEqualTo: true)
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
}
