import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sams_liqour/Database/Products.dart';
import 'package:sams_liqour/Models/Product.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];
  List<ProductModel> productsByCategory = [];
  ProductsServices _productsServices = ProductsServices();

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productsServices.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productsServices.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productsServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
