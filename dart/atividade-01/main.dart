enum Classificacao { semAvaliacoes, baixa, regular, alta }

void main() {
  const notaMinima = 1;
  const notaMaxima = 5;
  const notaPositiva = 4;

  // Todas as notas recebidas representam números inteiros.
  // Algumas estão fora do intervalo permitido.
  final notasRecebidas = <String, List<String>>{
    'Agenda UFAPE': ['5', '4', '5', '0', '3', '6'],
    'Biblioteca Digital': ['3', '2', '4', '1'],
    'Mapa do Campus': [],
    'Restaurante Universitário': ['5', '5', '4', '4', '5'],
    'Transporte Universitário': ['0', '6', '-1'],
  };

  final categoriasPorApp = <String, String>{
    'Agenda UFAPE': 'Organização',
    'Biblioteca Digital': 'Serviços',
    'Mapa do Campus': 'Localização',
    'Restaurante Universitário': 'Serviços',
    'Transporte Universitário': 'Serviços',
  };

  final contatosPorApp = <String, String?>{
    'Agenda UFAPE': 'agenda@exemplo.com',
    'Biblioteca Digital': null,
    'Mapa do Campus': 'mapa@exemplo.com',
    'Restaurante Universitário': 'ru@exemplo.com',
    // Transporte Universitário não possui chave neste mapa.
  };

  final notasValidasPorApp = <String, List<int>>{};
  final descartadasPorApp = <String, List<int>>{};
  final categoriasUnicas = <String>{};

  // QUESTÃO 1 — PREPARAÇÃO DOS DADOS
  for (var element in notasRecebidas.entries) {
    List<int> NotasValidas = [];
    List<int> NotasInvalidas = [];

    for (var nota in element.value) {
      int notaConvertida = int.parse(nota);

      if ( notaConvertida > 0 && notaConvertida <= 5) {
        NotasValidas.add(notaConvertida);
      } else {
        NotasInvalidas.add(notaConvertida);
      }
    }

    notasValidasPorApp[element.key] = NotasValidas;
    descartadasPorApp[element.key] = NotasInvalidas;

    categoriasUnicas.addAll(categoriasPorApp.values);
  }

  // QUESTÃO 2 — RELATÓRIO
  print('RELATÓRIO DE AVALIAÇÕES');
  print('======================');

  // TODO: para cada aplicativo, mostre categoria, contato, quantidade de
  // notas válidas e descartadas, média, porcentagem de notas positivas
  // (maiores ou iguais a notaPositiva) e classificação.
  // Use o enum Classificacao e switch para o texto da classificação.
  // Trate a ausência de contato e evite divisão por zero.

  print('\nCATEGORIAS ENCONTRADAS');
  // TODO: exiba as categorias sem repetições.
}
