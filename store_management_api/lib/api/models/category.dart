import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';

class Category extends BasicModel {
  int? _categoryId;
  String _title;

  Category({int? categoryId, required String title})
    : _categoryId = categoryId,
      _title = title {
    super.id = categoryId;
  }

  //Getters
  int? get categoryId => _categoryId;
  String get tilte => _title;

  //Setters
  set categoryId(int? value) {
    _categoryId = value;
    super.id = _categoryId;
  }

  set title(String value) => _title = value;

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(categoryId: json['categoryId'], title: json['title']);
  }
}
