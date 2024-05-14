import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'models/productBloc.dart';

class ProductBloc extends Cubit<List<Product>> {
  static const String _baseUrl = 'https://fakestoreapi.com';

  ProductBloc() : super([]);

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      emit(data.map((item) => Product.fromJson(item)).toList());
    } else {
      throw Exception('Failed to load products');
    }
  }
}
