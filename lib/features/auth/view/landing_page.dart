import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grinler/features/auth/view/login_view.dart';
import 'package:grinler/features/auth/view/signup_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // landingpagexYs (6:39)
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff000000),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              // heroimagecNX (6:46)
              width: 360,
              height: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(300),
                  bottomLeft: Radius.circular(300),
                ),
                child: Image.network(
                  'https://blog.hubspot.com/hubfs/how-to-make-a-meme.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              // autogroupu5b94VR (X2LB8qqP7t8FRhG2RBU5B9)
              padding: const EdgeInsets.fromLTRB(50, 28, 35, 72),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // writtencontentjbZ (56:172)
                    margin: const EdgeInsets.fromLTRB(6, 0, 0, 143),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // buildmemesbettertogetherSVy (6:47)
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 9),
                          constraints: const BoxConstraints(
                            maxWidth: 221,
                          ),
                          child: Text(
                            'Build memes \n      better\n   together',
                            style: GoogleFonts.modak(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              height: 1.505,
                              color: const Color(0xffffffff),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Container(
                          // bringtogetheryourfilesyourtool (6:41)
                          constraints: const BoxConstraints(
                            maxWidth: 269,
                          ),
                          child: Text(
                            'Bring together your files, your tools,\nprojects and people. Including a new \n mobile and desktop application.',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2125,
                              color: const Color(0x8ed9d9d9),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // autogroupk5yx4ZH (X2LAoSE3zxnCBW1WKQK5YX)
                    margin: const EdgeInsets.fromLTRB(0, 0, 14, 0),
                    width: double.infinity,
                    height: 56,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                          child: Container(
                            // registerbuttonM2b (56:170)
                            margin: const EdgeInsets.fromLTRB(0, 0, 19, 0),
                            width: 121,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffd9d9d9),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Text(
                                'Register',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          child: Container(
                            // signinbuttonjYw (56:171)
                            width: 121,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xfff02e65),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.inter(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  height: 1.2125,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
