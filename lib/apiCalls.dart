import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconstest/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  Future<List<UserModel>> getUserApi() async {
    List<UserModel> userList = [];
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));


    try {
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        for (Map<String, dynamic> item in data){
          print(item['name']);
          userList.add(UserModel.fromJson(item));
        }
        return userList;
      }
    } catch (e) {
      print(e);
    }
    return userList;
  }
}
