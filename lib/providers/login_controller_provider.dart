import 'package:ecommerce_ui/controllers/auth_controller.dart';
import 'package:ecommerce_ui/providers/states/login_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class LoginController extends StateNotifier<LoginState> {
//   LoginController(this.ref) : super(LoginInitial());

//   final Ref ref;

//   Future<void> login(String email, String password) async {
//     try {
//       state = LoginLoading();
//       await ref.read(authenticationControllerProvider).login(email, password);
//       state = LoginSuccess();
//     } catch (e) {
//       state = LoginFailure(e.toString());
//     }
//   }
// }

// final StateNotifierProvider<LoginController, LoginState>
//     loginControllerProvider =
//     StateNotifierProvider<LoginController, LoginState>(
//   (ref) {
//     return LoginController(ref);
//   },
// );
