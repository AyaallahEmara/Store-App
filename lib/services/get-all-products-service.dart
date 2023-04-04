import 'dart:convert';

import '../helper/api.dart';
import '../models/product-model.dart';
import 'package:http/http.dart' as http;
class AllProductsService
{
  Future<List<ProductModel>> getAllProducts() async
  {
    List<dynamic> data = await Api().get(url: 'https://fakestoreapi.com/products');
      List<ProductModel> productsList = [];

      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }
      return productsList;
  }
}