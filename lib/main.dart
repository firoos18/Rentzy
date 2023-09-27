import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentzy_rpl/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rentzy_rpl/core/di/injection.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/screens/home_screen.dart';
import 'firebase_options.dart';

import 'package:rentzy_rpl/authentication/presentation/screens/landing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(create: (_) => injection()),
    ],
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          final User? user = FirebaseAuth.instance.currentUser;

          context.read<AuthenticationBloc>().add(OnAppOpen(user));

          if (state is Authenticated) {
            return const HomeScreen();
          }

          return const Landing();
        },
      ),
    ),
  ));
}
