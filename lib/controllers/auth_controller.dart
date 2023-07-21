import 'dart:io';

import 'package:ecommerce_ui/providers/states/data_fetching_states.dart';
import 'package:ecommerce_ui/service/auth_service.dart';
import 'package:ecommerce_ui/views/home.dart';
import 'package:ecommerce_ui/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationController extends StateNotifier<DataFetchingState> {
  final AuthenticationService _authenticationService;
  AuthenticationController(this._authenticationService)
      : super(DataFetchingInitial());

  Future<void> login(String email, String password, context) async {
    try {
      state = DataFetchingLoading();
      await _authenticationService.login(email, password);
      state = DataFetchingSuccess();

      navigateToHome(context);
    } on SocketException catch (e) {
      state = DataFetchingFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } catch (e) {
      state = DataFetchingFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } finally {
      state = DataFetchingInitial();
    }
  }

  Future<void> register(
    String name,
    String email,
    String password,
    context,
  ) async {
    try {
      state = DataFetchingLoading();
      await _authenticationService.register(name, email, password);
      state = DataFetchingSuccess();

      navigateToHome(context);
    } on SocketException catch (e) {
      state = DataFetchingFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } catch (e) {
      state = DataFetchingFailure(e.toString());
      ToastWidget(message: e.toString());
      debugPrint(e.toString());
    } finally {
      state = DataFetchingInitial();
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

final StateNotifierProvider<AuthenticationController, DataFetchingState>
    authenticationControllerProvider =
    StateNotifierProvider<AuthenticationController, DataFetchingState>(
  (ref) {
    final AuthenticationService authenticationService =
        ref.watch(authenticationServiceProvider);
    return AuthenticationController(authenticationService);
  },
);
