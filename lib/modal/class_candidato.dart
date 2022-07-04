class Parlamentar {
  final String nome;
  final String urlFoto;
  final String siglaPartido;
  final String siglaUf;
  final int id;
  final String uri;
  final String uriPartido;
  final int idLegislatura;
  final String email;



  const Parlamentar({
    required this.nome,
    required this.urlFoto,
    required this.siglaPartido,
    required this.siglaUf,
    required this.id,
    required this.uri,
    required this.uriPartido,
    required this.idLegislatura,
    required this.email,
  });

  factory Parlamentar.fromJson(Map json) {
    return Parlamentar(
      nome: json['nome'] as String,
      urlFoto: json['urlFoto'] as String,
      siglaPartido: json['siglaPartido']as String,
      siglaUf: json['siglaUf']as String,
      id: json['id']as int,
      uri: json['uri']as String,
      uriPartido: json['uriPartido']as String,
      idLegislatura: json['idLegislatura']as int,
      email: json['email']as String,
    );
  }
}