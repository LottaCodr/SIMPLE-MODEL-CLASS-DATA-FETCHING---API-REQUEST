import 'package:flutter/material.dart';

class UserModel {
  int? id;
  String? userName;
  Company? company;

  UserModel({
    this.id,
    this.userName,
    this.company
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

      id: json['id'],
      userName: json['name'],

    );
  }


}

class Company {
  String? name;

  Company({
    this.name
  });

  Company.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
