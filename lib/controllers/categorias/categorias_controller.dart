import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/services/categoria_service.dart';

import '../../dart_week_api.dart';

class CategoriasController extends ResourceController {

  CategoriasController(this.context): service = CategoriaService(context);

  final ManagedContext context;
  final CategoriaService service;

  @Operation.get('tipo')
  Future<Response> buscarCategoriasPorTipo() async {
    try{
    final tipo = request.path.variables['tipo'];
    final tipoCategoria = TipoCategoria.values.firstWhere((t) => t.toString().split('.').last == tipo);

    return service
            .buscarCategoriaPorTipo(tipoCategoria)
            .then((res) => res.map((c) => {'id': c.id, 'nome': c.nome}).toList())
            .then((data) => Response.ok(data));
            
    }catch(e) {
      print(e);
      return Response.serverError(body: {'message': e.toString()});
    }
  }

}