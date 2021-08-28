abstract class UI {

  static void imprimirVariosPadroes(List<List<List<int>>> matrizes) {
    for (var i = 0; i < matrizes.length; i++) {
      
      print('PADRÃO: ${i + 1}');

      imprimirPadrao(matrizes[i]);

      print('');
    }
  }

  static void imprimirPadrao(List<List<int>> matriz) {
    for(var i = 0; i < matriz.length; i++) {
      
      var linha = '';
      
      for(var j = 0; j < matriz[i].length; j++) {

        if(matriz[i][j] == -1) {
          //linha += '\u{25A1}'; // quadrado em branco
          linha += '\u{2B1C}'; // quadrado em branco
        } else {
          //linha += '\u{25A0}'; // quadrado pintado
          linha += '\u{2B1B}'; // quadrado pintado
        }

      }
      print(linha);
    }
  }
}