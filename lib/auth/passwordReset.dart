import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentzy_rpl/auth/auth.dart';

class passwordReset extends StatefulWidget {
  const passwordReset({super.key});

  @override
  State<passwordReset> createState() => _passwordResetState();
}

class _passwordResetState extends State<passwordReset> {
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            //Title Text
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
                left: 24,
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password Reset',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff0E0F0E),
                    ),
                  ),

                  const SizedBox(
                    height: 42,
                  ),

                  //Illustration
                  Center(
                    child: SvgPicture.asset(
                      'assets/passwordReset.svg',
                      height: 279,
                      width: 239,
                    ),
                  ),

                  const SizedBox(
                    height: 29,
                  ),

                  //Enter OTP Text
                  Text(
                    'Enter a new password!',
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff0E0F0E),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  //Desc text
                  Text(
                    'Please enter a new password for your new login credentials.',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0E0F0E),
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  //password input text field
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

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: const Color(0xff974063)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
                      child: TextField(
                        controller: _repasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Re - Password",
                            hintStyle: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: const Color(0xff0E0F0E))),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 52,
                  ),

                  //Confirm Button
                  GestureDetector(
                    onTap: () {
                      if (_passwordController.text ==
                          _repasswordController.text) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Auth(),
                          ),
                        );
                      } else {
                        print('Incorrect password combination');
                      }
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF54768),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 141.2,
                          ),
                          child: Text(
                            'CONFIRM',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xffd9d9d9),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
