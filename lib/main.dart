import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solemne_2_dw/routes/app_routes.dart';
import 'package:solemne_2_dw/themes/my_theme.dart';
import 'package:solemne_2_dw/service/services.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductService())],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MarketPlace',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: Mytheme.myTheme,
    );
  }
}
