import 'dart:io';

import 'package:ecommerce_ui/providers/states/auth_states.dart';
import 'package:ecommerce_ui/service/auth_service.dart';
import 'package:ecommerce_ui/views/home.dart';
import 'package:ecommerce_ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<AuthenticationState> {
  final AuthenticationService _authenticationService;
  AuthenticationController(this._authenticationService)
      : super(AuthenticationInitial());

  Future<void> login(String email, String password, context) async {
    try {
      state = AuthenticationLoading();
      await _authenticationService.login(email, password);
      state = AuthenticationSuccess();

      navigateToHome(context);
    } on SocketException catch (e) {
      state = AuthenticationFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } catch (e) {
      state = AuthenticationFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } finally {
      state = AuthenticationInitial();
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    context,
  ) async {
    try {
      state = AuthenticationLoading();
      await _authenticationService.register(name, email, password);
      state = AuthenticationSuccess();

      navigateToHome(context);
    } on SocketException catch (e) {
      state = AuthenticationFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } catch (e) {
      state = AuthenticationFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } finally {
      state = AuthenticationInitial();
    }
  }
}

Future<void> navigateToHome(BuildContext context) async {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const HomeView(),
    ),
  );
}

final StateNotifierProvider<AuthenticationController, AuthenticationState>
    authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, AuthenticationState>(
  (ref) {
    final AuthenticationService authenticationService =
        ref.watch(authenticationServiceProvider);
    return AuthenticationController(authenticationService);
  },
);
