import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sams_liqour/Database/Products.dart';
import 'package:sams_liqour/Models/Product.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByCategory1 = [];
  List<ProductModel> productsByCategory2 = [];
  List<ProductModel> productsByCategory3 = [];
  List<ProductModel> featuredProducts = [];
  ProductsServices _productsServices = ProductsServices();

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productsServices.getProducts();
    productsByCategory = await _productsServices.getProductsOfCategory();
    productsByCategory1 = await _productsServices.getProductsOfCategory1();
    productsByCategory2 = await _productsServices.getProductsOfCategory2();
    productsByCategory3 = await _productsServices.getProductsOfCategory3();
    featuredProducts = await _productsServices.getFeaturedProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productsServices.getProductsOfCategory(category: 'Beers');
    productsByCategory1 =
        await _productsServices.getProductsOfCategory(category: 'Spirits');
    productsByCategory2 =
        await _productsServices.getProductsOfCategory(category: 'Wines');
    productsByCategory3 =
        await _productsServices.getProductsOfCategory(category: 'Soft Drinks');
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productsServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
