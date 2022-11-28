import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:rentzy_rpl/auth/passwordReset.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

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
                      'assets/register.svg',
                      height: 260,
                      width: 258.28,
                    ),
                  ),

                  const SizedBox(
                    height: 29,
                  ),

                  //Enter OTP Text
                  Text(
                    'Enter OTP Code!',
                    style: GoogleFonts.montserrat(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff0E0F0E),
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  //Desc text
                  Text(
                    'Please enter the 4 digits code from the Email sent to you',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff0E0F0E),
                    ),
                  ),

                  const SizedBox(
                    height: 52,
                  ),

                  //OTP Input Text Field
                  Center(
                    child: Pinput(
                      length: 4,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      keyboardType: TextInputType.number,
                      separator: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: const Color(0xffd9d9d9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'OTP Timeout in: ',
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '30',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  //resend code
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Did not receive OTP code?',
                          style: GoogleFonts.montserrat(fontSize: 12),
                        ),
                        Text(
                          ' Resend',
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: const Color(0xff41436A),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 32,
                  ),

                  //Confirm Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => passwordReset(),
                        ),
                      );
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
