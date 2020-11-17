import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:selcapital/httpClient.dart';
import 'package:selcapital/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String token;
  final Profile profile;
  final Map<String, dynamic> education;
  final Map<String, dynamic> work;
  final Map<String, dynamic> residence;
  final Map<String, dynamic> nextOfKin;

  User({
    this.token,
    this.profile,
    this.education,
    this.work,
    this.residence,
    this.nextOfKin,
  });

  factory User.fromJson(Map<String, dynamic> json, String token) {
    return User(
      token: token,
      profile: Profile.fromJson(json['data']['userData']['data']['profile']),
      education: json['data']['userData']['data']['education'],
      work: json['data']['userData']['data']['work'],
      residence: json['data']['userData']['data']['home_address'],
      nextOfKin: json['data']['userData']['data']['next_of_kin'],
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'profile': jsonEncode(profile),
        'education': education,
        'work': work,
        'residence': residence,
        'nextOfKin': nextOfKin,
      };
}

class SavedUser implements User {
  final String token;
  final Profile profile;
  final Map<String, dynamic> education;
  final Map<String, dynamic> work;
  final Map<String, dynamic> residence;
  final Map<String, dynamic> nextOfKin;

  SavedUser({
    this.token,
    this.profile,
    this.education,
    this.work,
    this.residence,
    this.nextOfKin,
  });

  factory SavedUser.fromJson(Map<String, dynamic> json) {
    return SavedUser(
      token: json['token'],
      profile: SavedProfile.fromJson(jsonDecode(json['profile'])),
      education: json['education'],
      work: json['work'],
      residence: json['residence'],
      nextOfKin: json['nextOfKin'],
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'profile': profile,
        'education': education,
        'work': work,
        'residence': residence,
        'nextOfKin': nextOfKin,
      };
}

class Profile {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final String picture;
  final String bvn;
  final String maritalStatus;

  Profile({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.dob,
    this.picture,
    this.bvn,
    this.maritalStatus,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['legal_name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dob: json['date_of_birth'],
      picture: json['file_name'],
      bvn: json['bvn'],
      maritalStatus: json['marital_status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'dob': dob,
        'picture': picture,
        'bvn': bvn,
        'maritalStatus': maritalStatus,
      };
}

class SavedProfile implements Profile {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String dob;
  final String picture;
  final String bvn;
  final String maritalStatus;

  SavedProfile({
    this.name,
    this.email,
    this.phone,
    this.gender,
    this.dob,
    this.picture,
    this.bvn,
    this.maritalStatus,
  });

  factory SavedProfile.fromJson(Map<String, dynamic> json) {
    return SavedProfile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      dob: json['dob'],
      picture: json['picture'],
      bvn: json['bvn'],
      maritalStatus: json['maritalStatus'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'gender': gender,
        'dob': dob,
        'picture': picture,
        'bvn': bvn,
        'maritalStatus': maritalStatus,
      };
}

class UserModel extends ChangeNotifier {
  final http.BaseClient httpClient = new HttpClient(kApiKey, http.Client());

  User _user = new User();

  User get user => _user;

  Timer updateProfile;

  Future<void> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String user = prefs.getString('user');
    _user = SavedUser.fromJson(jsonDecode(user));

    if (updateProfile != null) updateProfile.cancel();
    updateProfile = Timer.periodic(new Duration(seconds: 60), (timer) {
      this.fetchProfile();
    });

    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/login',
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        final token = jsonDecode(response.body)['token'];

        final userResponse = await httpClient.post(
          '$kBaseUrl/user/details',
          body: jsonEncode(<String, dynamic>{
            'token': token,
          }),
        );
        if (userResponse.statusCode < 300) {
          print('Response status: ${userResponse.statusCode}');
          print('Response body: ${userResponse.body}');
          _user = User.fromJson(jsonDecode(userResponse.body), token);

          notifyListeners();

          if (updateProfile != null) updateProfile.cancel();
          updateProfile = Timer.periodic(new Duration(seconds: 60), (timer) {
            this.fetchProfile();
          });

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('loggedIn', true);
          prefs.setString('user', jsonEncode(_user));

          return true;
        } else {
          throw Exception(userResponse.body);
        }
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  Future<bool> register(String name, String email, String phone, String dob,
      String password, String bvn) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/register/user',
        body: jsonEncode(<String, dynamic>{
          'profile': {
            'full_name': name,
            'email': email,
            'phone': phone,
            'date_of_birth': dob,
            'password': password,
            'is_individual': '',
            'bvn': bvn
          },
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        final token = jsonDecode(response.body)['token'];

        final userResponse = await httpClient.post(
          '$kBaseUrl/user/details',
          body: jsonEncode(<String, dynamic>{
            'token': token,
          }),
        );
        if (userResponse.statusCode < 300) {
          print('Response status: ${userResponse.statusCode}');
          print('Response body: ${userResponse.body}');
          _user = User.fromJson(jsonDecode(userResponse.body), token);

          notifyListeners();

          if (updateProfile != null) updateProfile.cancel();
          updateProfile = Timer.periodic(new Duration(seconds: 60), (timer) {
            this.fetchProfile();
          });

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setBool('loggedIn', true);
          prefs.setString('user', jsonEncode(_user));

          return true;
        } else {
          throw Exception(userResponse.body);
        }
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');

      notifyListeners();

      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/customer/reset/password',
        body: jsonEncode(<String, String>{
          'EMAIL': email,
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

  Future<void> fetchProfile() async {
    try {
      print(_user.token);
      final response = await httpClient.post(
        '$kBaseUrl/user/details',
        body: jsonEncode(<String, dynamic>{
          'token': _user.token,
        }),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        _user = User.fromJson(jsonDecode(response.body), _user.token);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', jsonEncode(_user));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  Future<bool> editProfile(
    String name,
    String email,
    String phone,
    String gender,
    String maritalStatus,
    String levelOfEducation,
    String employmentStatus,
    String workSector,
    String employerName,
    String workStartDate,
    String monthlyIncome,
    String typeOfResident,
    String address,
    String state,
    String lga,
    String residentYears,
    String nokName,
    String nokEmail,
    String nokPhone,
    String nokRelationship,
  ) async {
    try {
      final body = <String, dynamic>{
        'token': _user.token,
        'profile': {
          'legal_name': name,
          'email': email,
          'phone': phone,
          'date_of_birth': _user.profile.dob,
          'gender': gender,
          'marital_status': maritalStatus,
          'bvn': _user.profile.bvn,
          'file_name': _user.profile.picture,
        },
        'work': {
          'educational_qualification': levelOfEducation,
          'occupation_id': employmentStatus,
          'work_sector': workSector,
          'company_name': employerName,
          'work_start_date': workStartDate,
          "net_monthly_income": monthlyIncome,
        },
        'home_address': {
          'nature_of_accomodation': typeOfResident,
          'home_address': address,
          'home_state': state,
          'home_lga': lga,
          'resident_years': residentYears,
        },
        'next_of_kin': {
          'nok_name': nokName,
          'nok_email': nokEmail,
          'nok_phone': nokPhone,
          'nok_relationship': nokRelationship,
        },
      };
      final payload = jsonEncode(<String, dynamic>{
        'data': <String, dynamic>{
          'userData': <String, dynamic>{'data': body}
        }
      });
      final response = await httpClient.post(
        '$kBaseUrl/customer/save_data',
        body: jsonEncode(body),
      );
      if (response.statusCode < 300) {
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
        print(payload);
        _user = User.fromJson(jsonDecode(payload), _user.token);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user', jsonEncode(_user));

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

  Future<bool> editPassword(String currentPassword, String newPassword,
      String confirmPassword) async {
    try {
      final response = await httpClient.post(
        '$kBaseUrl/user/change_password',
        body: jsonEncode(<String, String>{
          'token': _user.token,
          'current_password': currentPassword,
          'password': newPassword,
          'confirm_password': confirmPassword,
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

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
    prefs.remove('user');
    if (updateProfile != null) updateProfile.cancel();
  }
}
