import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grinler/common/common.dart';
import 'package:grinler/common/roundedButtom_auth.dart';
import 'package:grinler/constants/constants.dart';
import 'package:grinler/features/auth/controllers/auth_controller.dart';
import 'package:grinler/features/auth/view/login_view.dart';
import 'package:grinler/features/auth/widgets/auth_field.dart';
import 'package:grinler/theme/theme.dart';

class SignUpView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  // appbar constant
  // will not render every time

  //!not using for this screen
  // final appbar = UIConstants.appBar();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onSignUp() {
    ref.read(authControllerProvider.notifier).signUp(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.arrow_turn_up_left),
        ),
        title: SvgPicture.asset(
          AssetsConstants.appLogo,
          color: Pallete.blueColor,
          height: 40,
        ),
        centerTitle: true,
      ),
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
                          'Let’s get started .',
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
                          'India’s first \nSocial Meme platform ',
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
                        height: 30,
                      ),
                      AuthField(
                        controller: passwordController,
                        hintText: "Password",
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: "Already have an account?",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: ' Login',
                              style: const TextStyle(
                                color: Pallete.blueColor,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    LoginView.route(),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 36),
                      Align(
                        alignment: Alignment.topCenter,
                        child: AuthRoundedButton(
                          backgroundColor: Colors.white.withOpacity(0.001),
                          onTap: onSignUp,
                          label: "Signup",
                          textColor: Colors.white,
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
