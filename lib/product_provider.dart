import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/product.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final List<dynamic> responseData = json.decode(response.body);
    _products = responseData.map((item) => Product.fromJson(item)).toList();
    notifyListeners();
  }
}
