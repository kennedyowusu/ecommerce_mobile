import 'package:ecommerce_ui/constants/colors.dart';
import 'package:ecommerce_ui/constants/themes.dart';
import 'package:ecommerce_ui/controllers/auth_controller.dart';
import 'package:ecommerce_ui/providers/states/auth_states.dart';
import 'package:ecommerce_ui/views/authentication/login.dart';
import 'package:ecommerce_ui/widgets/auth_button.dart';
import 'package:ecommerce_ui/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationView extends ConsumerWidget {
  RegistrationView({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthenticationState state =
        ref.watch(authenticationControllerProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/general/auth-bg.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              filterQuality: FilterQuality.high,
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: Container(
                height: MediaQueries.getHeight(context) / 1.5,
                width: double.infinity,
                constraints: const BoxConstraints(
                  minHeight: 300,
                ),
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Sign Up To Create An Account',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Full Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    InputField(controller: nameController),
                    SizedBox(height: 20),
                    Text(
                      "Email Address",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    InputField(controller: emailController),
                    SizedBox(height: 20),
                    Text(
                      "Password",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 5),
                    InputField(controller: passwordController),
                    SizedBox(height: 20),
                    state is AuthenticationLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: deepBlue,
                            ),
                          )
                        : AuthButton(
                            text: "Sign Up",
                            onPressed: () {
                              ref
                                  .read(
                                    authenticationControllerProvider.notifier,
                                  )
                                  .register(
                                    nameController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    context,
                                  );
                            },
                          ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginView(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
