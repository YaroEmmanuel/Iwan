import 'dart:convert';

import 'package:store_management_api/api/models/basicModel.dart';
import 'package:store_management_api/api/models/product.dart';
import 'package:store_management_api/api/models/sale.dart';

class SaleLine extends BasicModel {
  int? _saleLineId;
  int? _saleId;
  int? _productId;
  Sale? _sale;
  Product? _product;
  int? _quantity;
  double? _unitPrice;

  SaleLine({
    int? saleLineId,
    int? saleId,
    int? productId,
    Sale? sale,
    Product? product,
    int? quantity,
    double? unitPrice,
  }) : _saleLineId = saleLineId,
       _saleId = saleId,
       _productId = productId,
       _sale = sale,
       _product = product,
       _quantity = quantity,
       _unitPrice = unitPrice {
    super.id = _saleLineId;
  }

  //Getters
  int? get saleLineId => _saleLineId;
  int? get saleId => _saleId;
  int? get productId => _productId;
  Sale? get sale => _sale;
  Product? get product => _product;
  int? get quantity => _quantity;
  double? get unitPrice => _unitPrice;

  //Setters
  set saleLineId(int? value) {
    _saleLineId = value;
    super.id = _saleLineId;
  }

  set saleId(int? value) => _saleId = value;
  set productId(int? value) => _productId = value;
  set sale(Sale? value) => _sale = value;
  set product(Product? value) => _product = value;
  set quantity(int? value) => _quantity = value;
  set unitPrice(double? value) => _unitPrice;

  @override
  Map<String, dynamic> toJson() {
    return {
      'saleLineId': _saleLineId,
      'saleId': _saleId,
      'productId': _productId,
      'sale': _sale,
      'product': _product,
      'quantity': _quantity,
      'unitPrice': _unitPrice,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  factory SaleLine.fromJson(Map<String, dynamic> json) {
    return SaleLine(
      saleLineId: json['saleLineId'],
      saleId: json['saleId'],
      productId: json['productId'],
      sale: json['sale'] == null ? null : Sale.fromJson(json['sale']),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product']),
      quantity: json['quantity'],
      unitPrice: json['unitPrice'],
    );
  }
}
