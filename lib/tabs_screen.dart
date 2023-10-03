import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rentzy_rpl/instant_booking/presentation/screens/instant_booking_screen.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/screens/home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> screenList = [
    const HomeScreen(),
    const InstantBookingScreen(),
    const Center(
      child: Text('User Profile'),
    ),
  ];
  final List<String> title = [
    'Rentzy',
    'Instant Booking',
    'User Profile',
  ];
  int activeScreen = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          title[activeScreen],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.bell)),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xff0E0F0E),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GNav(
              onTabChange: (value) {
                setState(() {
                  activeScreen = value;
                });
              },
              gap: 4,
              tabBackgroundColor: const Color(0xffF1F1F1),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              iconSize: 20,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              color: Colors.white,
              tabs: const [
                GButton(
                  icon: FeatherIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: FeatherIcons.calendar,
                  text: 'Book',
                ),
                GButton(
                  icon: FeatherIcons.user,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      body: screenList[activeScreen],
    );
  }
}
