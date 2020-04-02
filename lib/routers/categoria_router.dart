import 'package:dart_week_api/config/jwt_authentication.dart';
import 'package:dart_week_api/controllers/categorias/categorias_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class CategoriaRouter {
  static void configurar(Router router, ManagedContext context) {
    router
      .route('/categorias/:tipo')
      .link(() => JwtAuthentication(context))
      .link(() => CategoriasController(context));
  }
}