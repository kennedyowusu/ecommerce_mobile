import 'package:ecommerce_ui/service/auth_service.dart';
import 'package:ecommerce_ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<bool> {
  final AuthenticationService _authenticationService;
  AuthenticationController(this._authenticationService) : super(false);

  Future<void> login(String email, String password, context) async {
    try {
      state = await _authenticationService.login(email, password);
      if (state) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeView()));
      }
    } catch (e) {
      state = false;
    }
  }
}

final StateNotifierProvider<AuthenticationController, bool>
    authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, bool>(
  (ref) {
    final AuthenticationService authenticationService =
        ref.watch(authenticationServiceProvider);
    return AuthenticationController(authenticationService);
  },
);
