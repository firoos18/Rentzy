import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentzy_rpl/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:rentzy_rpl/available_date/presentation/bloc/available_date_bloc.dart';
import 'package:rentzy_rpl/core/di/injection.dart';
import 'package:rentzy_rpl/motorcycle_detail/presentation/bloc/unit_detail_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/brand_filter/brand_filter_bloc.dart';
import 'package:rentzy_rpl/motorcycle_list/presentation/blocs/unit_list/unit_list_bloc.dart';
import 'package:rentzy_rpl/tabs_screen.dart';
import 'package:rentzy_rpl/user_reviews/presentation/bloc/user_reviews_bloc.dart';
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
      BlocProvider<UnitListBloc>(create: (_) => injection()),
      BlocProvider<UnitDetailBloc>(create: (_) => injection()),
      BlocProvider<AvailableDateBloc>(create: (_) => injection()),
      BlocProvider<UserReviewsBloc>(create: (_) => injection()),
      BlocProvider<BrandFilterBloc>(create: (_) => injection()),
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
            return const TabsScreen();
          }

          return const Landing();
        },
      ),
    ),
  ));
}
