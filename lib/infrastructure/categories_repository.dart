import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoryRepository {
  static final dio = Dio();

  Future<List<String>> fetchCategories() async {
    try {
      final response =
          await dio.get('https://fakestoreapi.com/products/categories');

      var categories = <String>[];

      for (int i = 0; i < response.data.length; i++) {
        categories.add(response.data[i].toString());
      }

      await Future.delayed(const Duration(seconds: 3));

      return categories;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
