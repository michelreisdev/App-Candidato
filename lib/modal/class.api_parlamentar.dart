class Parlamentar {
  final String nome;
  final String urlFoto;
  final String siglaPartido;
  final String siglaUf;


  const Parlamentar({
    required this.nome,
    required this.urlFoto,
    required this.siglaPartido,
    required this.siglaUf,
  });

  factory Parlamentar.fromJson(Map json) {
    return Parlamentar(
      nome: json['nome'] as String,
      urlFoto: json['urlFoto'] as String,
      siglaPartido: json['siglaPartido']as String,
      siglaUf: json['siglaUf']as String,
    );
  }
}