import 'package:projeto_hopfield/hopfield/hopfield_treinamento.dart';

class HopfieldModel {

  final int contador;
  final List<List<int>> padroes;
  final List<int> padraoDesconhecido;
  final List<HopfieldTreinamento> _treinamentos = List<HopfieldTreinamento>.empty(growable: true);
  List<HopfieldTreinamento> get treinamentos => _treinamentos;

  late int _contadorInterno;

  HopfieldModel({
    required this.contador,
    required this.padroes,
    required this.padraoDesconhecido,
  }) {
    _contadorInterno = 0;
  }

  void executar() {

    var matrizW = _obterMatrizW(padroes);

    // Vai começar a recursividade daqui sendo controlada pela variável _contadorInterno
    treinar(matrizW: matrizW, padraoDesconhecido: padraoDesconhecido);
  }

  void treinar({
    required List<List<int>> matrizW, 
    required List<int> padraoDesconhecido
  }) {

    if(_contadorInterno >= contador) return;

    _contadorInterno++;

    var padraoY = List<int>.empty(growable: true);

    for (var i = 0; i < matrizW.length; i++) {

      var valor = 0;

      for (var j = 0; j < matrizW[i].length; j++) {
        valor += matrizW[j][i] * padraoDesconhecido[j];
      }

      padraoY.add(valor >= 0 ? 1 : -1);
    }

    // Verificar se o vetorY bate com uma dos padrões
    if(conferirVetorYComPadroes(padraoY)) {
      print('achou');
      return;
    }
    
    treinar(matrizW: matrizW, padraoDesconhecido: padraoY);
    

  }

  bool conferirVetorYComPadroes(List<int> padraoY) {

    for(var padrao in padroes) { // Acessando cada padrão
      if(_conferirVetores(padrao, padraoY)) return true;
    }

    return false;
  }

  bool _conferirVetores(List<int> vetorA, List<int> vetorB) {

    for (var i = 0; i < vetorA.length; i++) {
      if(vetorA[i] != vetorB[i]) return false;
    }

    return true;
  }

  // No caso do exercício, vai dar uma matriz 30x30 pois meus vetores tem 30 posições
  List<List<int>> _obterMatrizW(List<List<int>> vetores) {

    // Pegar o tamanho do vetor do padrão
    var matrizW = _inicializarMatriz(vetores.first.length);

    // O
    for (var i = 0; i < matrizW.length; i++) {

      for (var j = i + 1; j < matrizW.length; j++) {
        
        var soma = 0;
      
        // Para somar os vetores eu acesso a quantidade de cada um
        for (var k = 0; k < vetores.length; k++) {
          
          // o meu i é que vai ser usado para percorrer a posição de cada array
          soma += (vetores[k][i] * vetores[k][j]);
        }

        matrizW[i][j] = soma;
        matrizW[j][i] = soma;
      }
    }

    // for (var i = 0; i < matrizW.length; i++) {
    //   print(matrizW[i]);
    // }

    return matrizW;
  }

  List<List<int>> _inicializarMatriz(int tamanho) {

    var matrizW = List<List<int>>.empty(growable: true);

    for (var i = 0; i < tamanho; i++) {
      
      var linha = List<int>.empty(growable: true);
      
      for (var j = 0; j < tamanho; j++) {
        linha.add(0);
      }

      matrizW.add(linha);
    }

    return matrizW;
  }

  List<int> _calcularPadrao({required List<int> vetorDePesos, required List<int> padraoDesconhecido}) {

    var padraoCalculado = List<int>.empty(growable: true);

    for (var i = 0; i < vetorDePesos.length; i++) {

      var calculo = vetorDePesos[i] * padraoDesconhecido[i];

      padraoCalculado.add(calculo >= 0 ? 1 : -1);
    }

    return padraoCalculado;
  }
}