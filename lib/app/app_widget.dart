import 'package:flutter/material.dart';
import 'package:projeto_pokedex/routes/go_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Projeto Pokedex',
        routerConfig: appRouter,
      ),
    );
  }
}
