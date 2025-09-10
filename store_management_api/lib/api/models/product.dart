import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/category.dart';

class Product extends BasicModel {
  int? _productId;
  int? _categoryId;
  Category? _category;
  String _title;
  String _codeQr;
  int? _stockQuantity;
  int? _alertThreshold;
  bool _enabled;

  Product({
    int? productId,
    int? categoryId,
    Category? category,
    required String title,
    required String codeQr,
    int? stockQuantity,
    int? alertThreshold,
    required bool enabled,
  }) : _productId = productId,
       _categoryId = categoryId,
       _category = category,
       _title = title,
       _codeQr = codeQr,
       _stockQuantity = stockQuantity,
       _alertThreshold = alertThreshold,
       _enabled = enabled {
    super.id = productId;
  }

  //Getters
  int? get productId => _productId;
  int? get categoryId => _categoryId;
  Category? get category => _category;
  String get title => _title;
  String get codeQr => _codeQr;
  int? get stockQuantity => _stockQuantity;
  int? get alertThreshold => _alertThreshold;
  bool get enabled => _enabled;

  //Setters
  set productId(int? value) {
    _productId = value;
    super.id = _productId;
  }

  set categoryId(int? value) => _categoryId = value;
  set category(Category? value) => _category = value;
  set title(String value) => _title = value;
  set codeQr(String value) => _codeQr = value;
  set stockQuantity(int? value) => _stockQuantity = value;
  set alertThreshold(int? value) => _alertThreshold = value;
  set enabled(bool value) => _enabled = value;

  @override
  Map<String, dynamic> toJson() {
    return {
      'ProductId': _productId,
      'categoryId': _categoryId,
      'category': _category,
      'title': _title,
      'codeQr': _codeQr,
      'stockQuantity': _stockQuantity,
      'alertThreshold': _alertThreshold,
      'enabled': _enabled,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'],
      categoryId: json['categoryId'],
      category: json['category'] == null
          ? null
          : Category.fromJson(json['role']),
      title: json['title'],
      codeQr: json['codeQr'],
      stockQuantity: json['stockQuantity'],
      alertThreshold: json['alertThreshold'],
      enabled: json['enabled'] ?? false,
    );
  }
}
