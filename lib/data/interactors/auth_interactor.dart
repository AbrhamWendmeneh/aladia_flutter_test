import 'package:tuple/tuple.dart';

import '../models/models.dart';

abstract class AuthInteractor {
  Future<Tuple2<User, String>?> signUp(
          String email, String password, String firstName, String lastName) =>
      throw UnimplementedError();
  Future<Tuple2<User, String>?> signIn(String email, String password) =>
      throw UnimplementedError();
  // Future<List<Session>?> getSessions() => throw UnimplementedError();

  // Future<void> signOut() => throw UnimplementedError();
  // getStoredAccessToken(string)
  Future<String?> getStoredAccessToken() => throw UnimplementedError();
  Future<void> clearStoredAccessToken() => throw UnimplementedError();
  //check user
  Future<bool?> checkUser(String email) => throw UnimplementedError();
}
