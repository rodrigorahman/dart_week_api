import 'package:dart_week_api/controllers/movimentacoes/salvar_movimentacao_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/model/movimentacao_model.dart';
import 'package:dart_week_api/model/usuario_model.dart';
import 'package:dart_week_api/repository/categoria_repository.dart';
import 'package:intl/intl.dart';

class MovimentacoesRepository {

  MovimentacoesRepository(this.context) : categoriaRespository = CategoriaRespository(context) ;
  final ManagedContext context;
  final CategoriaRespository categoriaRespository;

  Future<List<MovimentacaoModel>> buscarMovimentacoes(UsuarioModel usuarioModel, String anoMes) {
    final DateFormat format = DateFormat('yyyy_MM_DD');
    final inicio = format.parse('${anoMes.substring(0,4)}_${anoMes.substring(4)}_01');
    final fim = format.parse('${anoMes.substring(0,4)}_${anoMes.substring(4)}_31');

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).equalTo(usuarioModel.id)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..sortBy((m) => m.dataMovimentacao, QuerySortOrder.descending)
      ..sortBy((m) => m.id, QuerySortOrder.descending);

    return query.fetch();
  }

  Future<Map<String, dynamic>> recuperarTotalMesAno(UsuarioModel usuario, TipoCategoria tipoCategoria, String anoMes) async {
    final DateFormat format = DateFormat('yyyy_MM_DD');
    final inicio = format.parse('${anoMes.substring(0,4)}_${anoMes.substring(4)}_01');
    final fim = format.parse('${anoMes.substring(0,4)}_${anoMes.substring(4)}_31');

    final query = Query<MovimentacaoModel>(context)
      ..join(object: (m) => m.categoria)
      ..where((m) => m.usuario.id).equalTo(usuario.id)
      ..where((m) => m.dataMovimentacao).between(inicio, fim)
      ..where((m) => m.categoria.tipoCategoria).equalTo(tipoCategoria);
      

    final List<MovimentacaoModel> resultado = await query.fetch();
    final num total = resultado.fold(0.0, (total, m) => total += m.valor);
    return {'tipo': tipoCategoria.toString(), 'total': total};

  }

  Future<void> salvarMovimentacao(UsuarioModel usuario, SalvarMovimentacaoRequest request) async {
    final categoria = await categoriaRespository.buscarPorId(request.categoria);
    final model = MovimentacaoModel();
    model.categoria = categoria;
    model.dataMovimentacao = request.dataMovimentacao;
    model.descricao = request.descricao;
    model.usuario = usuario;
    model.valor = request.valor;

    await context.insertObject(model);

  }

}