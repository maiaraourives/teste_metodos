
import 'package:flutter/material.dart';

import 'config/routes/local_routes.dart';
import 'router_app.dart';
import 'services/navigation_service.dart';
import 'services/service_locator.dart';
import 'views/widgets/no_glow_effect.dart';


void main() {
  setupServiceLocator();
  runApp(const TestesDeGraficos());
}

class TestesDeGraficos extends StatelessWidget {
  const TestesDeGraficos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: const NoGlowEffect(),
          child: child!,
        );
      },
      navigatorKey:  getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Contatos',
      themeMode: ThemeMode.light,
      color: Colors.white,
      initialRoute: LocalRoutes.HOME,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
