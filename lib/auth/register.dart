import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentzy_rpl/auth/RegisterOtp.dart';

class Register extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Register({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();
  final _phoneControler = TextEditingController();

  checkPassword() {
    if (_passwordController.text != _repasswordController.text) {
      return _passwordController.text.trim();
    } else {
      print("password is correct");
    }
  }

  Future register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: checkPassword(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    _phoneControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/register.svg',
                        height: 260,
                        width: 258.28,
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),

                    //Register Title
                    Text(
                      "REGISTER",
                      style: GoogleFonts.montserrat(
                          fontSize: 36,
                          color: const Color(0xff0E0F0E),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),

                    const SizedBox(
                      height: 36,
                    ),

                    //Email input form
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

                    //phone number input form
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: const Color(0xff974063)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                        child: TextField(
                          controller: _phoneControler,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
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

                    //password input form
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: const Color(0xff974063)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
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

                    //Re password input form
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        border: Border.all(color: const Color(0xff974063)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                        child: TextField(
                          obscureText: true,
                          controller: _repasswordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Re - Password",
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

                    //register button
                    GestureDetector(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterOtp()),
                        );
                      }),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 17,
                          horizontal: 136,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF54768),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'REGISTER',
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

                    //already have account text button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.montserrat(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff0E0F0E)),
                        ),
                        GestureDetector(
                          onTap: widget.showLoginPage,
                          child: Text(
                            ' Login',
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: const Color(0xff41436A),
                                fontWeight: FontWeight.w700),
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
