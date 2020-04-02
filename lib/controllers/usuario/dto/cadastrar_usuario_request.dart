import 'package:dart_week_api/dart_week_api.dart';

class CadastrarUsuarioRequest extends Serializable {

  String login;
  String senha;

  @override
  Map<String, dynamic> asMap() {
    return {
      'login': login,
      'senha': senha
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    login = object['login'] as String;
    senha = object['senha'] as String;
  }

  Map<String,String> validate() {
    
    final Map<String,String> mapValidate = {};

    if(login == null || login.isEmpty) {
      mapValidate['login'] = 'Login obrigatório';
    }
    
    if(senha == null || senha.isEmpty) {
      mapValidate['senha'] = 'Senha obrigatório';
    }

    return mapValidate;

  }

  

}