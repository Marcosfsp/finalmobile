class Anime {
  int? id;
  String nome;
  String genero;
  int ano;
  bool assistido; // Novo campo

  Anime({
    this.id,
    required this.nome,
    required this.genero,
    required this.ano,
    this.assistido = false, // Valor padrão como não assistido
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'genero': genero,
      'ano': ano,
      'assistido': assistido ? 1 : 0, // Armazena como inteiro (1 = true, 0 = false)
    };
  }

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      id: map['id'],
      nome: map['nome'],
      genero: map['genero'],
      ano: map['ano'],
      assistido: map['assistido'] == 1,
    );
  }
}
