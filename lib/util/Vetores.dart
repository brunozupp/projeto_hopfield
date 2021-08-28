abstract class Vetores {

  static List<int> obterVetorDoPadrao(List<List<int>> matriz) {
    var vetor = List<int>.empty(growable: true);

    for (var i = 0; i < matriz.length; i++) {
      for (var j = 0; j < matriz[i].length; j++) {
        vetor.add(matriz[i][j]);
      }
    }

    return vetor;
  }

  static List<List<int>> obterVetoresDosPadroes(List<List<List<int>>> matrizes) {

    var vetores = List<List<int>>.empty(growable: true);

    for (var i = 0; i < matrizes.length; i++) {
      vetores.add(obterVetorDoPadrao(matrizes[i]));
    }

    return vetores;
  }

}