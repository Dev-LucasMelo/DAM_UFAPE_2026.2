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

      if (notaConvertida > 0 && notaConvertida <= 5) {
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
  print('\nRELATÓRIO DE AVALIAÇÕES');
  print('======================');

  // TODO: para cada aplicativo, mostre categoria, contato, quantidade de
  // notas válidas e descartadas, média, porcentagem de notas positivas
  // (maiores ou iguais a notaPositiva) e classificação.
  // Use o enum Classificacao e switch para o texto da classificação.
  // Trate a ausência de contato e evite divisão por zero.

  // classificação");
  for (var registro in notasRecebidas.entries) {
    double media = 0.0;
    int contadorNotasPositivas = 0;
    double porcentagemNotasPositivas = 0.0;

    print("Nome: ${registro.key}");
    print("Categoria: ${categoriasPorApp[registro.key]}");

    if (contatosPorApp[registro.key] == null) {
      print("Contato: Não informado");
    } else {
      print("Contato: ${contatosPorApp[registro.key]}");
    }

    print("Qtd notas de válidas: ${notasValidasPorApp[registro.key]!.length}");
    print("Qtd notas descartadas: ${descartadasPorApp[registro.key]!.length}");

    if (notasValidasPorApp[registro.key]?.isEmpty == false) {
      for (var nota in notasValidasPorApp[registro.key] ?? []) {
        media = media + nota;

        if (nota >= 4) {
          contadorNotasPositivas++;
        }
      }

      media = media / notasValidasPorApp[registro.key]!.length;

      porcentagemNotasPositivas =
          (contadorNotasPositivas * 100) /
          notasValidasPorApp[registro.key]!.length;

      print("média das notas válidas: ${media}");
      print("porcentagem de notas positivas: ${porcentagemNotasPositivas}%");
    } else {
      print("média das notas válidas: Não calculado");
      print("porcentagem de notas positivas: Não calculado");
    }

    Classificacao classificacao;

    if (notasValidasPorApp[registro.key]!.isEmpty) {
      classificacao = Classificacao.semAvaliacoes;
    } else if (media >= 4) {
      classificacao = Classificacao.alta;
    } else if (media >= 3) {
      classificacao = Classificacao.regular;
    } else {
      classificacao = Classificacao.baixa;
    }

    switch (classificacao) {
      case Classificacao.alta:
        print("Classificação: Alta");
        break;

      case Classificacao.regular:
        print("Classificação: Regular");
        break;

      case Classificacao.baixa:
        print("Classificação: Baixa");
        break;

      case Classificacao.semAvaliacoes:
        print("Classificação: Sem avaliações");
        break;
    }

    print('======================\n');
  }

  print('\nCATEGORIAS ENCONTRADAS\n');
  int contadorCategorias = 0;

  for (var categoria in categoriasUnicas) {
    contadorCategorias++;
    print("categoria ${contadorCategorias}: ${categoria}");
  }
  
}
