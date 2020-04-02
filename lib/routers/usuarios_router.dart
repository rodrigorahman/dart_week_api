import 'package:dart_week_api/controllers/login/login_controller.dart';
import 'package:dart_week_api/controllers/usuario/usuario_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class UsuariosRouter {

  static void configurar(Router router, ManagedContext context) {
    router
      .route('/login')
      .link(() => LoginController(context));

    router
      .route('/usuario')
      .link(() => UsuarioController(context));
  }

}