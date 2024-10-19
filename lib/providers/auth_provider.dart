import 'package:flutter/material.dart';
import '../data/interactors/auth_interactor.dart';
import '../data/models/models.dart';

enum AuthLoading {
  checkingAuth,
  signingIn,
  signingUp,
  signingOut,
  checkingUser,
  verifyingUser,
}

class AuthProvider extends ChangeNotifier {
  final AuthInteractor _authInteractor;

  AuthProvider({required AuthInteractor authInteractor})
      : _authInteractor = authInteractor {
    checkStoredAccessToken();
  }

  AuthLoading? _authLoading = AuthLoading.checkingAuth;
  AuthLoading? get authLoading => _authLoading;
  set authLoading(AuthLoading? value) {
    _authLoading = value;
    notifyListeners();
  }

  List<User> _users = [];
  List<User> get users => _users;
  set users(List<User> v) {
    _users = v;
    notifyListeners();
  }

  bool _isGuest = false;
  bool get isGuest => _isGuest;
  set isGuest(bool value) {
    _isGuest = value;
    notifyListeners();
  }

  List<Session> _sessions = [];
  List<Session> get sessions => _sessions;
  set sessions(List<Session> v) {
    _sessions = v;
    notifyListeners();
  }

  void signIn({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(String) onFail,
  }) async {
    try {
      authLoading = AuthLoading.signingIn;
      final res = await _authInteractor.signIn(email, password);
      if (res == null) {
        throw "No user data";
      }
      users = [res.item1, ...users];
      authLoading = null;
      onSuccess();
    } catch (e) {
      authLoading = null;
      onFail(e.toString());
    }
  }

  void signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required VoidCallback onSuccess,
    required Function(String) onFail,
  }) async {
    try {
      authLoading = AuthLoading.signingUp;
      final res =
          await _authInteractor.signUp(email, password, firstName, lastName);
      if (res == null) {
        throw "No user data";
      }
      users = [res.item1, ...users];

      authLoading = null;
      onSuccess();
    } catch (e) {
      authLoading = null;
      onFail(e.toString());
    }
  }

  Future<bool> checkUser(String email) async {
    try {
      authLoading = AuthLoading.checkingUser;
      notifyListeners();
      final res = await _authInteractor.checkUser(email);
      debugPrint('checkUser: ${res.toString()}');
      authLoading = null;
      notifyListeners();
      if (res.item1 == false) {
        debugPrint('internet error');
        throw Exception('Failed to check user: ${res.item2}');
      }
      debugPrint('res.item2: ${res.item2}');
      return res.item2;
    } catch (e) {
      authLoading = null;
      notifyListeners();
      throw Exception('Failed to check user: $e');
    }
  }

  Future<void> checkStoredAccessToken() async {
    final accessToken = await _authInteractor.getStoredAccessToken();
    if (accessToken != null) {
      final user = User(
        id: '',
        email: '',
        firstName: '',
        lastName: '',
        isEmailVerified: false,
        phoneNumber: '',
        isPhoneNumberVerified: false,
      );
      users = [user];
      authLoading = null;
    } else {
      authLoading = null;
    }
  }

  Future<bool> verifyUser(String email, String code) async {
    try {
      authLoading = AuthLoading.verifyingUser;
      final res = await _authInteractor.verifyUser(email, code);
      authLoading = null;
      return res;
    } catch (e) {
      authLoading = null;
      return false;
    }
  }

  Future<void> signOut() async {
    await _authInteractor.clearStoredAccessToken();
    users = [];
    sessions = [];
    authLoading = null;
    notifyListeners();
  }
}
