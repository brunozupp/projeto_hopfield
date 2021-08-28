import 'package:projeto_hopfield/hopfield/hopfield_model.dart';
import 'package:projeto_hopfield/util/Padroes.dart';
import 'package:projeto_hopfield/util/UI.dart';
import 'package:projeto_hopfield/util/Vetores.dart';

abstract class Hopfield {
  
  static void executar() {

    // Um contador para saber a quantidade máxima de iteração
    // Os vetores que são os padrões para reconhecimento

    var a = [1,1,1,-1];
    var b = [1,1,1,1];
    var c = [-1,-1,1,1];

    var padroes = List<List<int>>.empty(growable: true);
    padroes.add(a);
    padroes.add(b);
    padroes.add(c);

    var pesoDesconhecido = [1,1,-1,-1];
    var pesoDesconhecido2 = [1,-1,1,-1];

    var hopfield = HopfieldModel(
      contador: 10,
      padroes: padroes,
      padraoDesconhecido: pesoDesconhecido
      // padroes: Vetores.obterVetoresDosPadroes(
      //   Padroes.obterPadroes
      // )
    );

    hopfield.executar();
    
  }

  static void imprimirPadroes() {
    UI.imprimirVariosPadroes(Padroes.obterPadroes);
  }

}