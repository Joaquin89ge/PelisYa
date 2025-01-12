import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pelis_ya/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const name = "home-string";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(Environment.theMovieDbKey),
      ),
    );
  }
}
