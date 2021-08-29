import 'package:projeto_hopfield/hopfield/hopfield_model.dart';
import 'package:projeto_hopfield/hopfield/status.dart';
import 'package:projeto_hopfield/util/padroes.dart';
import 'package:projeto_hopfield/util/ui.dart';
import 'package:projeto_hopfield/util/vetores.dart';

abstract class Hopfield {
  
  static void executar() {

    // Um contador para saber a quantidade máxima de iteração
    // Os vetores que são os padrões para reconhecimento

    // var a = [1,1,1,-1];
    // var b = [1,1,1,1];
    // var c = [-1,-1,1,1];

    // var padroes = List<List<int>>.empty(growable: true);
    // padroes.add(a);
    // padroes.add(b);
    // padroes.add(c);

    // var padraoDesconhecido = [1,1,-1,-1];
    // var padraoDesconhecido2 = [1,-1,1,-1];

    var padroes = Vetores.obterVetoresDosPadroes(
      Padroes.obterPadroes
    );

    var padraoDesconhecido = Vetores.obterVetorDoPadrao(
      Padroes.obterPadraoDesconhecido
    );

    var hopfield = HopfieldModel(
      iteracoesMaxima: 10,
      padroes: padroes,
      padraoDesconhecido: padraoDesconhecido
    );

    hopfield.executar();

    print('Status = ${obterStatus(hopfield.status)}');
    print('Número de iterações realizadas: ${hopfield.iteracoes}');
  }

  static String obterStatus(Status status) {

    switch(status) {

      case Status.SEM_EXECUCAO:
        return 'Ainda não foi executado';
      case Status.EXECUTANDO:
        return 'Está executando';
      case Status.FINALIZADO_COM_SUCESSO:
        return 'Finalizado com SUCESSO \u{1F600}';
      case Status.FINALIZADO_SEM_SUCESSO:
        return 'Finalizado SEM SUCESSO \u{1F62D}';
    }
  }

  static void imprimirPadroes() {
    UI.imprimirVariosPadroes(Padroes.obterPadroes);
  }

}