import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentzy_rpl/auth/forgetPassword.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const Login({super.key, required this.showRegisterPage});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 71),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //image
                    Center(
                      child: SvgPicture.asset(
                        'assets/login.svg',
                        height: 373,
                        width: 225,
                      ),
                    ),

                    //Login Text
                    Text(
                      "LOGIN",
                      style: GoogleFonts.montserrat(
                          fontSize: 36,
                          color: const Color(0xff0E0F0E),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),

                    const SizedBox(
                      height: 36,
                    ),

                    //Email Input Form
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: const Color(0xff974063)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff0E0F0E),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    //Password Input Form
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: const Color(0xff974063)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xff0E0F0E))),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 24,
                    ),

                    //Forget Password
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => forgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xff0E0F0E)),
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    //Login Button
                    GestureDetector(
                      onTap: logIn,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 152),
                        decoration: BoxDecoration(
                          color: const Color(0xffF54768),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    //Dont have account? Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff0E0F0E)),
                        ),
                        GestureDetector(
                          onTap: widget.showRegisterPage,
                          child: Text(
                            " Register",
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff41436A)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
