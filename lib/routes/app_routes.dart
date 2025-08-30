import 'package:flutter/material.dart';
import 'package:solemne_2_dw/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'register': (BuildContext context) => const RegisterScreen(),
    'error': (BuildContext context) => const ErrorScreen(),

    // Proveedores
    'view_suppliers': (BuildContext context) => const ViewSuppliersScreen(),
    'create_suppliers': (BuildContext context) => const CreateSuppliersScreen(),
    'edit_suppliers': (BuildContext context) => const EditSuppliersScreen(),

    // Categorias
    'view_categories': (BuildContext context) => const ViewCategScreen(),
    'create_categories': (BuildContext context) => const CreateCategScreen(),
    'edit_categories': (BuildContext context) => const EditCategScreen(),

    // Productos
    'view_products': (BuildContext context) => const ViewProductsScreen(),
    'create_products': (BuildContext context) => const CreateProductsScreen(),
    'edit_products': (BuildContext context) => const EditProductsScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorScreen());
  }
}
