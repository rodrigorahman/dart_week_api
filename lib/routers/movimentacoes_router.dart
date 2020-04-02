import 'package:dart_week_api/config/jwt_authentication.dart';
import 'package:dart_week_api/controllers/movimentacoes/movimentacoes_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class MovimentacoesRouter {
  static void configurar(Router router, ManagedContext context) {
    router
      .route('/movimentacoes/:anoMes')
      .link(() => JwtAuthentication(context))
      .link(() => MovimentacoesController(context));

    router
      .route('movimentacoes/total/:totalAnoMes')
      .link(() => JwtAuthentication(context))
      .link(() => MovimentacoesController(context));

    router
      .route('movimentacoes/')
      .link(() => JwtAuthentication(context))
      .link(() => MovimentacoesController(context));
  }
}