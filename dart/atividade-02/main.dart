abstract class Livro {
  final int codigo;
  String _titulo;
  final String? autor;

  Livro({required this.codigo, required String titulo, this.autor})
    : _titulo = titulo.trim();

  String get titulo => _titulo;

  set titulo(String novoTitulo) {
    if (novoTitulo.trim().isNotEmpty) {
      _titulo = novoTitulo.trim();
    }
  }

  String descricao();
}

abstract interface class Emprestavel {
  bool consultarDisponibilidade();

  bool emprestar();

  void devolver();
}

class LivroFisico extends Livro implements Emprestavel {
  final int numeroPaginas;
  bool _disponivel = true;

  LivroFisico({
    required super.codigo,
    required super.titulo,
    super.autor,
    required this.numeroPaginas,
  });

  @override
  String descricao() {
    return '''
      Livro Físico
      Código: $codigo
      Título: $titulo
      Autor: ${autor ?? 'Autor desconhecido'}
      Número de páginas: $numeroPaginas
    ''';
  }

  @override
  bool consultarDisponibilidade() {
    return _disponivel;
  }

  @override
  bool emprestar() {
    if (!_disponivel) {
      return false;
    }

    _disponivel = false;
    return true;
  }

  @override
  void devolver() {
    _disponivel = true;
  }
}

class LivroDigital extends Livro {
  final double tamanhoMB;

  LivroDigital({
    required super.codigo,
    required super.titulo,
    super.autor,
    required this.tamanhoMB,
  });

  @override
  String descricao() {
    return '''
      Livro Digital
      Código: $codigo
      Título: $titulo
      Autor: ${autor ?? 'Autor desconhecido'}
      Tamanho: $tamanhoMB MB
    ''';
  }
}

// Extension para gerar a referência do livro
extension ReferenciaLivro on Livro {
  String get referencia {
    return '$titulo - ${autor ?? 'Autor desconhecido'}';
  }
}

void main() {
  final livroFisico = LivroFisico(
    codigo: 1,
    titulo: 'A República',
    autor: 'Platão',
    numeroPaginas: 416,
  );

  final livroDigital = LivroDigital(
    codigo: 2,
    titulo: 'Meditações',
    autor: 'Marco Aurélio',
    tamanhoMB: 8.5,
  );

  final livroSemAutor = LivroFisico(
    codigo: 3,
    titulo: 'Assim Falou Zaratustra',
    numeroPaginas: 352,
  );

  List<Livro> livros = [livroFisico, livroDigital, livroSemAutor];

  for (var livro in livros) {
    print(livro.descricao());
    print('Referência: ${livro.referencia}');
    print('----------------------------');
  }

  livroFisico.titulo = ' A República - Edição Comentada ';
  print('Novo título: ${livroFisico.titulo}');

  livroFisico.titulo = '   ';
  print('Título após entrada em branco: ${livroFisico.titulo}');

  print('\n===== EMPRÉSTIMOS =====');

  print('Disponível: ${livroFisico.consultarDisponibilidade()}');

  if (livroFisico.emprestar()) {
    print('Empréstimo realizado com sucesso!');
  }

  if (livroFisico.emprestar()) {
    print('Empréstimo realizado com sucesso!');
  } else {
    print('Empréstimo recusado: livro já emprestado.');
  }

  livroFisico.devolver();

  print('Disponível após devolução: ${livroFisico.consultarDisponibilidade()}');
}
