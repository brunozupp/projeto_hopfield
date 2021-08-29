abstract class Padroes {

  static List<List<int>> get obterPadraoDesconhecido => [
    [1,1,1,1,1,-1],
    [-1,-1,-1,-1,-1,-1],
    [-1,1,1,1,-1,-1],
    [-1,-1,-1,-1,-1,-1],
    [1,1,-1,1,1,-1],
  ];

  static List<List<List<int>>> get obterPadroes {
    var padroes = List<List<List<int>>>.empty(growable: true);
    padroes.add(obterPadrao1);
    padroes.add(obterPadrao2);
    padroes.add(obterPadrao3);
    padroes.add(obterPadrao4);
    padroes.add(obterPadrao5);
    //padroes.add(obterPadrao6);
    padroes.add(obterPadrao7);

    return padroes;
  }

  static List<List<int>> get obterPadrao1 => [
    [1,1,1,1,1,-1],
    [-1,-1,-1,-1,1,1],
    [-1,1,1,1,1,-1],
    [-1,-1,-1,-1,1,1],
    [1,1,1,1,1,-1],
  ];

  static List<List<int>> get obterPadrao2 => [
    [1,1,-1,-1,1,1],
    [1,1,-1,-1,1,1],
    [1,1,1,1,1,1],
    [-1,-1,-1,-1,1,1],
    [-1,-1,-1,-1,1,1],
  ];

  static List<List<int>> get obterPadrao3 => [
    [-1,-1,1,1,-1,-1],
    [-1,1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
    [-1,1,1,1,1,-1],
  ];

  static List<List<int>> get obterPadrao4 => [
    [-1,1,1,1,1,-1],
    [1,1,-1,-1,1,1],
    [1,1,1,1,1,1],
    [1,1,-1,-1,1,1],
    [-1,1,1,1,1,-1],
  ];

  static List<List<int>> get obterPadrao5 => [
    [1,1,1,1,1,1],
    [-1,-1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
  ];

  static List<List<int>> get obterPadrao6 => [
    [1,1,-1,-1,-1,-1],
    [1,1,-1,-1,-1,-1],
    [1,1,-1,-1,-1,-1],
    [1,1,-1,-1,-1,-1],
    [1,1,1,1,1,1],
  ];

  static List<List<int>> get obterPadrao7 => [
    [-1,-1,1,1,-1,-1],
    [-1,-1,1,1,-1,-1],
    [-1,1,1,1,1,-1],
    [1,1,-1,-1,1,1],
    [1,1,1,1,1,1],
  ];
}