import 'package:dart_week_api/model/movimentacao_model.dart';

import '../dart_week_api.dart';

class CategoriaModel extends ManagedObject<_CategoriaModel> implements _CategoriaModel {}

enum TipoCategoria{
  receita, despesa
}

@Table(name: 'categoria')
class _CategoriaModel {
  @Column(primaryKey: true)
  int id;

  @Column()
  String nome;
  
  @Column()
  TipoCategoria tipoCategoria;

  ManagedSet<MovimentacaoModel> movimentacoes;
}