import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/model/usuario_model.dart';

import '../dart_week_api.dart';

class MovimentacaoModel extends ManagedObject<_MovimentacaoModel> implements _MovimentacaoModel {}

@Table(name: 'movimentacao')
class _MovimentacaoModel {
  
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column()
  String descricao;

  @Column()
  DateTime dataMovimentacao;
  
  @Column()
  double valor;
  
  @Relate(#movimentacoes)
  UsuarioModel usuario;

  @Relate(#movimentacoes)
  CategoriaModel categoria;

}