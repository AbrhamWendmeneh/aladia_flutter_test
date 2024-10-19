import 'dart:convert';

import 'package:aladia_flutter_test/data/interactors/auth_interactor.dart';
import 'package:aladia_flutter_test/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class AuthServices implements AuthInteractor {
  // final AuthRepo _authRepo;
  final authUrl = 'https://dev-api.aladia.io/v2/auth';

  AuthServices();
  // :
  // _authRepo = authRepo;
  // @override
  // Future<List<Session>?> getSessions() async {
  //   try {
  //     return await _authRepo.findSessions();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<Tuple2<User, String>?> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$authUrl/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        final accessToken = data['accessToken'];
        // store the token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
        debugPrint('response: ${response.body}');
        // Since the response does not include user details, I skip user parsing
        final user = User(
          id: '',
          email: email,
          firstName: '',
          lastName: '',
          isEmailVerified: false,
          phoneNumber: '',
          isPhoneNumberVerified: false,
        );
        return Tuple2(user, accessToken);
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Failed to sign in: ${errorData['message']}');
      } else if (response.statusCode == 401) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Unauthorized: ${errorData['message']}');
      } else if (response.statusCode == 403) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Forbidden: ${errorData['message']}');
      } else if (response.statusCode == 404) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        debugPrint('email: $email, password: $password');
        throw Exception('Not Found: ${errorData['message']}');
      } else if (response.statusCode == 422) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Validation error: ${errorData['message']}');
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<User, String>?> signUp(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$authUrl/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
        }),
      );
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final user = User(
          id: data['id'],
          email: data['email'],
          firstName: firstName,
          lastName: lastName,
          isEmailVerified: false,
          phoneNumber: '',
          isPhoneNumberVerified: false,
        );

        // Store the token if it exists
        return Tuple2(user, '');
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Failed to sign up: ${errorData['message']}');
      } else if (response.statusCode == 422) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Validation error: ${errorData['message']}');
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Tuple2<bool, bool>> checkUser(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$authUrl/user-existence'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
        }),
      );
      debugPrint('response: ${response.statusCode}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('data: ${data['exists']}');
        return Tuple2(true, data['exists']);
      } else if (response.statusCode == 400) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        debugPrint('errordata,${errorData}');
        throw Exception('Failed to check user: ${errorData['message']}');
      } else if (response.statusCode == 422) {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Validation error: ${errorData['message']}');
      } else {
        throw Exception('Failed to check user');
      }
    } catch (e) {
      return const Tuple2(false, false);
    }
  }

  @override
  Future<bool> verifyUser(String email, String code) async {
    debugPrint('email: $email, code: $code');
    try {
      final response = await http.post(
        Uri.parse('$authUrl/verify-user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'code': int.parse(code),
        }),
      );
      debugPrint('response: ${response.statusCode}');

      if (response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final accessToken = data['accessToken'];
        // store the token
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
        return true;
      } else {
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        throw Exception('Failed to verify user: ${errorData['message']}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getStoredAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  @override
  Future<void> clearStoredAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('accessToken');
  }
}
