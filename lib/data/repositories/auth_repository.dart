import '../models/models.dart';

abstract class AuthRepo {
  Future<void> storeUser(User user) => throw UnimplementedError();
  Future<List<User>?> findUsers() => throw UnimplementedError();
  Future<void> removeUser(String id) => throw UnimplementedError();

  Future<void> storeSession(Session session) => throw UnimplementedError();
  Future<List<Session>?> findSessions() => throw UnimplementedError();
  Future<void> removeSession(String id) => throw UnimplementedError();

  // Guest Mode
  Future<void> storeGuestMode(bool val) => throw UnimplementedError();
  Future<bool?> findGuestMode() => throw UnimplementedError();
}
