import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class Api
{
  Future<dynamic> get({required String url}) async
  {
    http.Response response =
    await http.get(Uri.parse(url));

    if(response.statusCode==200)
      {
        return jsonDecode(response.body);
      }
    else
      {
        throw Exception('There is a problem with status code ${response.statusCode}');
      }
  }
  Future<dynamic> post({required String url,
    @required dynamic body,}) async
  {
    http.Response response =
    await http.post(Uri.parse(url)
      , body: body
      ,);
    if(response.statusCode==200) {

      return jsonDecode(response.body);
    }
    else
      {
        throw Exception('There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
      }
  }

  Future<dynamic> put({required String url,
    @required dynamic body,}) async
  {
    http.Response response =
    await http.put(Uri.parse(url)
      , body: body
      ,);
    if(response.statusCode==200) {
      //print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
    else
    {
      throw Exception('There is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}