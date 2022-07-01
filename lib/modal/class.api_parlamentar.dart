class Parlamentar {
  final String NomeCompletoParlamentar;
  final String UrlFotoParlamentar;
  final String SiglaPartidoParlamentar;


  const Parlamentar({
    required this.NomeCompletoParlamentar,
    required this.UrlFotoParlamentar,
    required this.SiglaPartidoParlamentar,
  });

  factory Parlamentar.fromJson(Map json) {
    return Parlamentar(
      NomeCompletoParlamentar: json['IdentificacaoParlamentar']['NomeCompletoParlamentar'] as String,
      UrlFotoParlamentar: json['IdentificacaoParlamentar']['UrlFotoParlamentar'] as String,
      SiglaPartidoParlamentar: json['IdentificacaoParlamentar']['SiglaPartidoParlamentar'] as String,
    );
  }
}