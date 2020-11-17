import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';

class Products {
  final List<dynamic> data;

  Products({this.data});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      data: json['data'],
    );
  }
}

class Investments {
  final List<dynamic> data;

  Investments({this.data});

  factory Investments.fromJson(Map<String, dynamic> json) {
    return Investments(
      data: json['loans'],
    );
  }
}

class InvestmentModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  UserModel _userModel = new UserModel();

  List<dynamic> _investments = [];
  List<dynamic> _products = [];

  dynamic _currentProduct;
  dynamic _currentInvestment;

  List<dynamic> get investments => _investments;
  List<dynamic> get products => _products;

  dynamic get currentProduct => _currentProduct;
  dynamic get currentInvestment => _currentInvestment;

  void update(UserModel userModel) {
    _userModel = userModel;

    notifyListeners();
  }

  Future<bool> fetchProducts() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/investments/products',
        body: jsonEncode(<String, dynamic>{
          'token': _userModel.user?.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _products = Products.fromJson(jsonDecode(response.body)).data;

        notifyListeners();

        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  setCurrentProduct(Map<String, dynamic> product) {
    print(product);
    _currentProduct = product;

    notifyListeners();
  }

  Future<bool> fetchInvestments() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/investment/portfolio',
        body: jsonEncode(<String, dynamic>{
          'token': _userModel.user?.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _investments = Investments.fromJson(jsonDecode(response.body)).data;

        notifyListeners();

        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  setCurrentInvestment(Map<String, dynamic> investment) {
    print(investment);
    _currentInvestment = investment;

    notifyListeners();
  }

  Future<bool> save(String amount, String duration) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/investment/create',
        body: jsonEncode(<String, dynamic>{
          'token': _userModel.user?.token,
          'plan': {
            'amount': amount,
            'duration': duration,
            'funding_source': '1',
            'category': _currentProduct['INVESTMENT_PRODUCT_ID'],
          },
          'card': {
            'connected_card_id': '86640',
          },
          'paystack': {
            'reference': '',
          },
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        notifyListeners();

        return true;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }
}
