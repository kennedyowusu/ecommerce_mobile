import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationService {
  bool isLoggedIn = false;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 3000), () {
      isLoggedIn = true;
    });
    return isLoggedIn;
  }
}

final Provider<AuthenticationService> authenticationServiceProvider =
    Provider<AuthenticationService>(
  (ref) {
    return AuthenticationService();
  },
);
