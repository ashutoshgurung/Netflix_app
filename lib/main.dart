// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/provider/detail_screen_provider.dart';
import 'package:netflix_app/provider/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:netflix_app/firebase_options.dart';
import 'package:netflix_app/routes/app_routes.dart';
import 'package:netflix_app/provider/search_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => DetailScreenProvider()),
        ChangeNotifierProvider(create: (_) => MoviesProvider()..getTrailers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix Clone',
        initialRoute: AppRoutes.home,
        routes: AppRoutes.routes,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
