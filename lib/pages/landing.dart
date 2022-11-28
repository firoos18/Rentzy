import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentzy_rpl/auth/auth.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Rentzy
            Text(
              "Rentzy!",
              style: GoogleFonts.montserrat(
                  fontSize: 64,
                  color: const Color(0xff41436A),
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 138,
            ),

            //illustration
            Center(
              child: SvgPicture.asset(
                'assets/landing.svg',
                width: 339,
                height: 197.33,
              ),
            ),
            const SizedBox(
              height: 72.67,
            ),

            //Find the best text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Find the Best',
                  style: GoogleFonts.montserrat(fontSize: 30),
                ),
                Text(
                  ' Bike',
                  style: GoogleFonts.montserrat(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff41436A),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'to Rent Today!',
                style: GoogleFonts.montserrat(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 133,
            ),

            //Get Started Button
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Auth(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xffF54768),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'GET STARTED',
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: const Color(0xffD9D9D9),
                            fontWeight: FontWeight.w700),
                      ),
                      const Icon(
                        FeatherIcons.chevronRight,
                        color: Color(0xffD9D9D9),
                        size: 24,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
