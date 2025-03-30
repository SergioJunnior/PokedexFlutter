import 'package:go_router/go_router.dart';
import 'package:projeto_pokedex/core/splash/splash_page.dart';
import 'package:projeto_pokedex/presentation/pages/home/home.dart';
import 'package:projeto_pokedex/routes/routes.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(
        initialRoute: HomePage(),
      ),
    ),
    GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
  ],
);
