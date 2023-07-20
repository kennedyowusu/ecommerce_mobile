import 'package:ecommerce_ui/providers/states/login_states.dart';
import 'package:ecommerce_ui/service/auth_service.dart';
import 'package:ecommerce_ui/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<LoginState> {
  final AuthenticationService _authenticationService;
  AuthenticationController(this._authenticationService) : super(LoginInitial());

  Future<void> login(String email, String password, context) async {
    try {
      state = LoginLoading();
      await _authenticationService.login(email, password);
      state = LoginSuccess();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } catch (e) {
      state = LoginFailure(e.toString());
    }
  }
}

final StateNotifierProvider<AuthenticationController, LoginState>
    authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, LoginState>(
  (ref) {
    final AuthenticationService authenticationService =
        ref.watch(authenticationServiceProvider);
    return AuthenticationController(authenticationService);
  },
);
