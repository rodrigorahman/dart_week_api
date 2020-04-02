import 'package:dart_week_api/dart_week_api.dart';

class SalvarMovimentacaoRequest extends Serializable {

  int categoria;
  DateTime dataMovimentacao;
  String descricao;
  double valor;

  @override
  Map<String, dynamic> asMap() {
    return {
      'categoria': categoria,
      'descricao': descricao,
      'dataMovimentacao': dataMovimentacao,
      'valor': valor
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    categoria = object['categoria'] as int;
    descricao = object['descricao'] as String;
    final dataMovimentacaoStr = object['dataMovimentacao'] as String;
    dataMovimentacao = dataMovimentacaoStr != null ? DateTime.parse(dataMovimentacaoStr) : null;
    valor = object['valor'] as double;
  }

  Map<String, String> validate() {
    final Map<String,String> validateResult = {};
    
    if(categoria == null) {
      validateResult['categoria'] = 'Categoria não informada';
    }

    if(valor == null) {
      validateResult['valor'] = 'Valor não informado';
    }

    if(dataMovimentacao == null) {
      validateResult['dataMovimentacao'] = 'Data da Movimentação não informada';
    }

    return validateResult;
  }
  

}