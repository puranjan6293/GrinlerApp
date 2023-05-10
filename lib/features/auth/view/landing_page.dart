import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grinler/features/auth/view/login_view.dart';
import 'package:grinler/features/auth/view/signup_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Wrap(
        children: [
          SafeArea(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(150),
                        bottomRight: Radius.circular(150)),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/img.jpeg",
                        ),
                        fit: BoxFit.cover)),
              ),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Build memes",
                          style: GoogleFonts.righteous(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      Text("better",
                          style: GoogleFonts.righteous(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      Text("together",
                          style: GoogleFonts.righteous(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Text(
                  "Bring Together your files, your tools, projects and people. Including a new mobile and desktop application",
                  style: TextStyle(
                      fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        },
                        child: const SizedBox(
                            height: 60,
                            width: 110,
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ))),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(240, 46, 101, 1)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginView()));
                      },
                      child: const SizedBox(
                        height: 60,
                        width: 110,
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
