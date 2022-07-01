class Parlamentar {
  final String NomeCompletoParlamentar;


  const Parlamentar({
    required this.NomeCompletoParlamentar,
  });

  factory Parlamentar.fromJson(Map json) {
    return Parlamentar(
      NomeCompletoParlamentar: json['IdentificacaoParlamentar']['NomeCompletoParlamentar'] as String,
    );
  }
}