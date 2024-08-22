import 'package:flutter/material.dart';
import 'package:projeto_pokedex/presentation/pages/home/home.dart';

import '../core/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projeto Pokedex',
        home: SplashPage(initialRoute: HomePage()),
      ),
    );
  }
}
