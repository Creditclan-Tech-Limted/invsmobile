import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:selcapital/providers/user.dart';

class SavingsModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  UserModel _userModel = new UserModel();

  final Map _savings = new Map();

  UnmodifiableMapView get savings => UnmodifiableMapView(_savings);

  List<dynamic> get savingsList => _savings['savings'];

  String _planId;
  String _goalName;
  String _targetAmount;
  String _automate;
  String _frequency;
  String _frequencyAmount;
  String _startDate;
  String _duration;

  String get frequency => _frequency;

  void update(UserModel userModel) {
    _userModel = userModel;

    notifyListeners();
  }

  void addPlan(String id) {
    _planId = id;
    print(_planId);

    notifyListeners();
  }

  void addGoalName(String name) {
    _goalName = name;
    print(_goalName);

    notifyListeners();
  }

  void addTargetAmount(String amount) {
    _targetAmount = amount;
    print(_targetAmount);

    notifyListeners();
  }

  void addAutomate(String option) {
    _automate = option;
    print(_automate);

    notifyListeners();
  }

  void addFrequency(String frequency) {
    _frequency = frequency;
    print(_frequency);

    notifyListeners();
  }

  void addFrequencyAmount(String amount) {
    _frequencyAmount = amount;
    print(_frequencyAmount);

    notifyListeners();
  }

  void addStartDate(String date) {
    _startDate = date;
    print(_startDate);

    notifyListeners();
  }

  void addDuration(String duration) {
    _duration = duration;
    print(_duration);

    notifyListeners();
  }

  Future<bool> save() async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/apply_for_savings',
        body: jsonEncode(<String, dynamic>{
          'token': _userModel.user?.token,
          'plan': {
            'title': _goalName,
            'amount': _frequencyAmount,
            'target': _targetAmount,
            'frequency': _frequency,
            'duration': _duration,
            'start_date': _startDate,
            'funding_source': '1',
            'category': _planId,
            'automated': _automate,
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
