import 'package:projeto_hopfield/hopfield/hopfield_treinamento.dart';
import 'package:projeto_hopfield/hopfield/status.dart';
import 'package:projeto_hopfield/util/ui.dart';

class HopfieldModel {

  final int iteracoesMaxima;
  final List<List<int>> padroes;
  final List<int> padraoDesconhecido;
  final List<HopfieldTreinamento> _treinamentos = List<HopfieldTreinamento>.empty(growable: true);
  List<HopfieldTreinamento> get treinamentos => _treinamentos;

  late Status status;
  late int _contadorInterno;

  int get iteracoes => _treinamentos.length;

  HopfieldModel({
    required this.iteracoesMaxima,
    required this.padroes,
    required this.padraoDesconhecido,
  }) {
    _contadorInterno = 0;
    status = Status.SEM_EXECUCAO;
  }

  void executar() {

    var matrizW = _obterMatrizW(padroes);

    status = Status.EXECUTANDO;

    print('Padrão Y - Padrão de entrada');
    _imprimir(padraoDesconhecido);

    // Vai começar a recursividade daqui sendo controlada pela variável _contadorInterno
    treinar(matrizW: matrizW, padraoDesconhecido: padraoDesconhecido);
  }

  void treinar({
    required List<List<int>> matrizW, 
    required List<int> padraoDesconhecido
  }) {

    if(_contadorInterno >= iteracoesMaxima) {
      status = Status.FINALIZADO_SEM_SUCESSO;
      return;
    }

    _contadorInterno++;

    var padraoY = List<int>.empty(growable: true);

    for (var i = 0; i < matrizW.length; i++) {

      var valor = 0;

      for (var j = 0; j < matrizW[i].length; j++) {
        valor += matrizW[j][i] * padraoDesconhecido[j];
      }

      padraoY.add(valor >= 0 ? 1 : -1);
    }

    print('Padrão Y - $_contadorInterno');
    _imprimir(padraoY);

    // Verificar se o vetorY bate com uma dos padrões
    if(conferirVetorYComPadroes(padraoY)) {
      _treinamentos.add(HopfieldTreinamento(
        correto: true, 
        padraoY: padraoY
      ));

      status = Status.FINALIZADO_COM_SUCESSO;

      return;
    } else {
      _treinamentos.add(HopfieldTreinamento(
        correto: false, 
        padraoY: padraoY
      ));
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

  void _imprimir(List<int> vetor) {
    var matriz = List<List<int>>.empty(growable: true);

    var separador = 0;
    var listaAux = List<int>.empty(growable: true);

    for(var i = 0; i < vetor.length; i++) {
      separador++;

      listaAux.add(vetor[i]);

      if(separador == 6) {

        matriz.add(listaAux);

        separador = 0;
        listaAux = List<int>.empty(growable: true);
      }
    }

    UI.imprimirPadrao(matriz);
    print('');
  }

  // No caso do exercício, vai dar uma matriz 30x30 pois meus vetores tem 30 posições
  List<List<int>> _obterMatrizW(List<List<int>> vetores) {

    // Pegar o tamanho do vetor do padrão
    var matrizW = _inicializarMatriz(vetores.first.length);

    for (var i = 0; i < matrizW.length; i++) {

      for (var j = 0; j < matrizW[i].length; j++) {

        if(j >= i) break;
        
        var soma = 0;
      
        // Para somar os vetores eu acesso a quantidade de cada um
        for (var k = 0; k < vetores.length; k++) {
          
          // k -> responsável por acessar um padrão por vez
          // i e j -> usados para acessar os elementos dos padrões e fazer o somatório
          soma += (vetores[k][i] * vetores[k][j]);
        }

        matrizW[j][i] = matrizW[i][j] = soma;
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
}