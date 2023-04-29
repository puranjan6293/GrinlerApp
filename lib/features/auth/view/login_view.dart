import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grinler/common/common.dart';
import 'package:grinler/constants/constants.dart';
import 'package:grinler/features/auth/controllers/auth_controller.dart';
import 'package:grinler/features/auth/view/signup_view.dart';
import 'package:grinler/features/auth/widgets/auth_field.dart';
import 'package:grinler/theme/pallete.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  // appbar constant
  // will not render every time
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Let’s sign you in .',
                          style: GoogleFonts.inter(
                            color: const Color(0xffffffff),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Welcome back .\nYou’ve been missed !',
                          style: GoogleFonts.inter(
                            color: const Color(0xffffffff).withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 55.0,
                      ),
                      AuthField(
                        controller: emailController,
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      AuthField(
                        controller: passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.topRight,
                        child: RoundedButton(
                          onTap: onLogin,
                          label: "Login",
                        ),
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: "Don't have an account?",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    SignUpView.route(),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
