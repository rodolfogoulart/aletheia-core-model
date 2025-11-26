// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
// ignore_for_file: omit_local_variable_types

import 'dart:convert';

import 'package:aletheia_core/aletheia_core.dart';

// class SubText {
//   String text;
//   Map<String, dynamic> attributes;
//   SubText(this.text, this.attributes);

//   @override
//   String toString() => 'SubText(text: $text, attributes: $attributes)';
// }

// class Content {
//   List<SubText> texts;
//   Content(this.texts);
// }

/// Posição dos atributos em um intervalo de texto
class AttributesPosition {
  Map<String, dynamic> attributes;
  int start;
  int end;
  AttributesPosition({
    required this.attributes,
    required this.start,
    required this.end,
  });

  @override
  String toString() =>
      'AttributesPosition(attributes: $attributes, start: $start, end: $end)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attributes': attributes,
      'start': start,
      'end': end,
    };
  }

  factory AttributesPosition.fromMap(Map<String, dynamic> map) {
    return AttributesPosition(
      attributes: Map<String, dynamic>.from(
          (map['attributes'] as Map<String, dynamic>)),
      start: map['start'] as int,
      end: map['end'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttributesPosition.fromJson(String source) =>
      AttributesPosition.fromMap(json.decode(source) as Map<String, dynamic>);
}

///checar se esta dentro do range
bool isBetween(int a, int b, int a1, int b1, {exclusive = true}) {
  // if (exclusive) {
  //   return (a >= a1 && a <= b1) || (b <= b1 && b >= a1);
  // } else {
  //   return (a > a1 && a < b1) || (b < b1 && b > a1);
  // }
  if (exclusive) {
    // Verifica se há sobreposição entre os intervalos [a, b] e [a1, b1]
    return (a >= a1 && a <= b1) ||
        (b >= a1 && b <= b1) ||
        (a1 >= a && a1 <= b) ||
        (b1 >= a && b1 <= b);
  } else {
    // Verifica sobreposição estrita (sem bordas)
    return (a > a1 && a < b1) ||
        (b > a1 && b < b1) ||
        (a1 > a && a1 < b) ||
        (b1 > a && b1 < b);
  }
}

(List<SubText> texts, int? processNextEnd) setAttributesOnPosition(
    Content content, Map<String, dynamic> attributesAt, int initAt, int endAt) {
  print('Original SubTexts:');
  for (var e in content.subText!) {
    print(e);
  }
  //
  List<AttributesPosition> positions = [];

  //
  int currentPosition = 0;
  String text = '';

  ///quando não precisa processar lista, pois novos valores estão entre valores já existentes da lista
  bool skipProcess = false;

  ///retorno caso endAt seja maior que o tamanho total do texto, para processar próximo
  int? processNextEnd;

  //preenche positions
  for (var i = 0; i < content.subText!.length; i++) {
    SubText currentText = content.subText![i];
    int currentLength = currentText.text.length;
    text += currentText.text;
    int currentEnd = currentLength + currentPosition;
    int currentStart = currentPosition;
    //
    Map<String, dynamic>? attributes = currentText.attributes ?? {};
    //se valor é o mesmo que já é compreendido pela lista
    if (initAt == currentStart && endAt == currentEnd) {
      attributes = {...attributes, ...attributesAt};
      skipProcess = true;
    }

    positions.add(AttributesPosition(
        attributes: attributes, start: currentStart, end: currentEnd));
    //
    currentPosition += currentLength;
  }
  //recuperar qual é a ultima posicao
  positions.sort((a, b) => a.end.compareTo(b.end));

  print('-----------------------------------');
  print('     add $initAt - $endAt         >> $attributesAt\n\n');

  for (var e in positions) {
    print(
        '${e.start} - ${e.end} ${isBetween(e.start, e.end, initAt, endAt, exclusive: true) ? 'Adicionar' : ''}');
  }
  print('-----------------------------------');

  void printP(AttributesPosition p) {
    print('${p.start} - ${p.end}         >> ${p.attributes}\n');
  }

  if (skipProcess) {
    for (var i = 0; i < positions.length; i++) {
      printP(positions[i]);
    }
  }

  //quando initAt e endAt compreender todo o range
  //0 - 5
  //5 - 11
  //11- 21
  //add > 0 - 21
  //ou add > 0 - 30
  if (positions.first.start == initAt && positions.last.end <= endAt) {
    for (var i = 0; i < positions.length; i++) {
      positions[i].attributes = {...positions[i].attributes, ...attributesAt};
      printP(positions[i]);
    }
    skipProcess = true;
  }

  //para processar no proximo range content
  //0 - 5
  //5 - 11
  //11- 21
  //add > 0 - 30
  //resta 21 - 30 para processar no proximo
  if (positions.last.end < endAt) {
    processNextEnd = endAt - positions.last.end;
    if (processNextEnd <= 0) {
      processNextEnd = null;
    }
    //o start vai ser 0 neste caso
  }

  List<AttributesPosition> newPositions = [];
  int a1 = initAt;
  int b1 = endAt;
  Map<String, dynamic> atn = attributesAt;
  //
  for (var i = 0; i < positions.length; i++) {
    AttributesPosition current = positions[i];
    int currentPosStart = current.start;
    int currentPosEnd = current.end;
    //
    Map<String, dynamic> at = current.attributes;

    //caso esteja finalizado
    if (currentPosEnd == b1) {
      //preenche o novo array de posições com as seguintes
      for (var t = i + 1; t < positions.length; t++) {
        newPositions.add(positions[t]);
      }
      //finaliza o array neste caso
      break;
    }
    //
    if (currentPosStart == a1 && currentPosEnd == b1) {
      newPositions.add(AttributesPosition(
          attributes: {...at, ...atn},
          start: currentPosStart,
          end: currentPosEnd));
      //preenche o novo array de posições com as seguintes
      for (var t = i + 1; t < positions.length; t++) {
        newPositions.add(positions[t]);
      }
      //finaliza o array neste caso
      break;
    } else {
      /*
            a=0 - b=3
            >0 - 2
            >2 - 3
            */

      //a=0 < a1=2
      if (currentPosStart < a1) {
        newPositions.add(AttributesPosition(
            attributes: {...at}, start: currentPosStart, end: a1)); // 0 - 2
        if (currentPosEnd < b1) {
          newPositions.add(AttributesPosition(
              attributes: {...at, ...atn},
              start: a1,
              end: currentPosEnd)); // 2 - 3
          a1 = currentPosEnd; // 3 - 7
        }
      } else if (currentPosStart == a1) {
        // newPositions.add(AttributesPosition(attributes: {...at, ...atn}, start: a, end: b));
      }
    }
  }

  List<AttributesPosition> processa() {
    List<AttributesPosition> newPositions = [];
    int a1 = initAt;
    int b1 = endAt;
    Map<String, dynamic> atn = attributesAt;
    //
    for (var i = 0; i < positions.length; i++) {
      AttributesPosition c = positions[i];
      int a = c.start;
      int b = c.end;
      //
      Map<String, dynamic> at = c.attributes;

      if (a == a1 && b == b1) {
        newPositions.add(
            AttributesPosition(attributes: {...at, ...atn}, start: a, end: b));
        printP(newPositions.last);
        //preenche o novo array de posições com as seguintes
        for (var t = i + 1; t < positions.length; t++) {
          newPositions.add(positions[t]);
          printP(newPositions.last);
        }
        //finaliza o array neste caso
        break;
      } else {
        /*
            a=0 - b=3
            >0 - 2
            >2 - 3
            */
        //só se estiver no range
        if (isBetween(a, b, a1, b1)) {
          //a=0 < a1=2
          if (a < a1) {
            //caso nao esteja no range
            if (b < a1) {
              newPositions.add(AttributesPosition(
                  attributes: {...at}, start: a, end: b)); // 0 - 2
              printP(newPositions.last);
            } else {
              //caso esteja no range
              newPositions.add(AttributesPosition(
                  attributes: {...at}, start: a, end: a1)); // 0 - 2
              printP(newPositions.last);
              if (b < b1) {
                newPositions.add(AttributesPosition(attributes: {
                  ...at,
                  ...(isBetween(a1, b, a1, b1, exclusive: false) ? atn : {})
                }, start: a1, end: b)); // 2 - 3
                printP(newPositions.last);
                a1 = b; // 3 - 7
              } else {
                if (b == b1) {
                  //antes de adicionar o restante, adiciona a posição que falta
                  newPositions.add(AttributesPosition(attributes: {
                    ...at,
                    ...(isBetween(a1, b, a1, b1, exclusive: true) ? atn : {})
                  }, start: a1, end: b)); // 2 - 3
                  printP(newPositions.last);
                }
                //? Adicionado por AI
                else {
                  // b > b1: precisa dividir em duas partes
                  // Parte com atributos novos: a1 até b1
                  newPositions.add(AttributesPosition(
                      attributes: {...at, ...atn}, start: a1, end: b1));
                  printP(newPositions.last);
                  // Parte sem atributos novos: b1 até b
                  newPositions.add(AttributesPosition(
                      attributes: {...at}, start: b1, end: b));
                  printP(newPositions.last);
                }
                //? End Adicionado por AI
              }
            }
          } else if (a == a1) {
            if (b < b1) {
              newPositions.add(AttributesPosition(attributes: {
                ...at,
                ...(isBetween(a, b, a1, b1, exclusive: false) ? atn : {})
              }, start: a, end: b));
              printP(newPositions.last);
              a1 = b;
            } else {
              //0-2 > precisa exclusive:true
              newPositions.add(AttributesPosition(attributes: {
                ...at,
                ...(isBetween(a, b1, a1, b1, exclusive: true) ? atn : {})
              }, start: a, end: b1));
              printP(newPositions.last);
              //caso contrario, b == b1 já foi adicionado acima
              if (b > b1) {
                newPositions.add(AttributesPosition(attributes: {
                  ...at,
                  ...(isBetween(b1, b, a1, b1, exclusive: false) ? atn : {})
                }, start: b1, end: b));
                printP(newPositions.last);
              }
              //praticamente, finaliza
              a1 = b1;
            }
          }
        } else {
          newPositions.add(positions[i]);
          printP(newPositions.last);
        }

        if (b == b1 || a1 == b1) {
          //preenche o novo array de posições com as seguintes
          for (var t = i + 1; t < positions.length; t++) {
            newPositions.add(positions[t]);
            printP(newPositions.last);
          }
          //finaliza o array neste caso
          break;
        }
      }
    }
    return newPositions;
  }

  if (!skipProcess) {
    positions = processa();
  }
  //final
  //nova lista de subTexts
  List<SubText> subTexts = [];
  //recriar subText com atributos apartir das posições
  for (var i = 0; i < positions.length; i++) {
    //
    int pStart = positions[i].start;
    int pEnd = positions[i].end;
    //
    String t = text.substring(pStart, pEnd);
    SubText newSubText = SubText(text: t, attributes: positions[i].attributes);
    subTexts.add(newSubText);
  }

  //fazer um loop do positions reconstruindo o novo subText com os delimitadores initAt e endAt

  //final tem que retornar um index do initAt e endAt > 0 caso o escopo do content.texts seja maior que o endAt
  //neste caso o initAt vai ter que ser 0 o endAt vai ter que ser endAt - o tamanho do texto que foi atribuido neste escopo de positions.
  print('initAt: $initAt | endAt: $endAt\n');
  print(jsonDecode(jsonEncode(positions)));
  print('processNextEnd: $processNextEnd');
  print('\n');
  print('Result SubTexts:');
  for (var e in subTexts) {
    print(e);
  }

  return (subTexts, processNextEnd);
}

/// Aplica atributos em uma lista de Contents baseado em posições globais
///
/// [contents]: Lista de Contents a serem modificados
///
/// [attributesAt]: Atributos a serem aplicados
///
/// [initAt]: Posição inicial global para aplicar os atributos
///
/// [endAt]: Posição final global para aplicar os atributos
List<Content> setContentAttributesOnPosition({
  required List<Content> contents,
  required Map<String, dynamic> attributesAt,
  required int initAt,
  required int endAt,
}) {
  /// Posição global atual ao percorrer os Contents
  int globalPosition = 0;

  /// Lista para armazenar os Contents atualizados
  List<Content> updatedContents = [];

  for (var i = 0; i < contents.length; i++) {
    Content currentContent = contents[i];

    // Calcula o tamanho total do conteúdo atual
    int contentLength = currentContent.subText!
        .map((e) => e.text.length)
        .fold(0, (a, b) => a + b);

    int contentStart = globalPosition;
    int contentEnd = globalPosition + contentLength;

    // Verifica se o intervalo de atributos afeta este conteúdo
    if (endAt > contentStart && initAt < contentEnd) {
      // Calcula as posições relativas dentro deste conteúdo
      // Se initAt está antes deste content, começa do 0
      // Se initAt está dentro deste content, usa a posição relativa
      int localStart = initAt <= contentStart ? 0 : initAt - contentStart;

      // Se endAt está depois deste content, vai até o fim
      // Se endAt está dentro deste content, usa a posição relativa
      int localEnd = endAt >= contentEnd ? contentLength : endAt - contentStart;

      print(
          'Processing Content $i: globalPos=$globalPosition, contentStart=$contentStart, contentEnd=$contentEnd');
      print(
          '  Local range: $localStart to $localEnd (global: $initAt to $endAt)');

      // Aplica os atributos neste conteúdo
      // processNextEnd é ignorado aqui, pois localEnd já está ajustado para este conteúdo
      // processNextEnd retorna null neste caso, mas se não ajustado, poderia ser usado para o próximo conteúdo
      var (updatedSubTexts, processNextEnd) = setAttributesOnPosition(
        currentContent,
        attributesAt,
        //localStart calculado acima
        localStart,
        //localEnd calculado acima
        localEnd,
      );

      // Atualiza o conteúdo com os novos SubTexts
      updatedContents.add(currentContent..subText = updatedSubTexts);
    } else {
      // Este conteúdo não é afetado, mantém como está
      updatedContents.add(currentContent);
    }

    globalPosition += contentLength;
  }

  return updatedContents;
}

/// Configurações para filtrar palavras ao aplicar atributos
class FilterWordBy {
  /// Se deve diferenciar maiúsculas de minúsculas
  ///
  /// Caso false, 'Palavra' e 'palavra' serão consideradas iguais
  ///
  /// Default: true
  bool caseSensitive;

  /// Se deve corresponder a palavra inteira
  ///
  /// Caso false, busca por 'com' em 'começar' ou 'acompanhar' serão consideradas correspondências pois fazem parte da palavra
  ///
  /// Default: true
  bool wholeWord;
  FilterWordBy({
    this.caseSensitive = true,
    this.wholeWord = true,
  });
}

/// Aplica atributos em todas as ocorrências de uma palavra em uma lista de Contents
///
/// [contents]: Lista de Contents a serem modificados
///
/// [attributesAt]: Atributos a serem aplicados
///
/// [word]: Palavra a ser buscada e modificada
///
List<Content> setContentAttributesOnAWord(
  List<Content> contents,
  Map<String, dynamic> attributesAt,
  String word, {
  FilterWordBy? filterBy,
}) {
  filterBy ??= FilterWordBy();

  List<Content> newContents = [];
  //
  for (var content in contents) {
    String fullText = content.subText!.map((e) => e.text).join();
    // Ajusta a palavra e o texto completo conforme a sensibilidade de caso
    if (filterBy.caseSensitive == false) {
      word = word.toLowerCase();
      fullText = fullText.toLowerCase();
    }
    int startIndex = 0;
    print('Full text: $fullText');

    while (true) {
      // Encontra a próxima ocorrência da palavra
      int foundIndex = fullText.indexOf(word, startIndex);

      // Aplicar filtros
      if (foundIndex != -1 && filterBy.wholeWord) {
        // Verifica se é uma correspondência de palavra inteira
        bool isStartBoundary = foundIndex == 0 ||
            !RegExp(r'\w').hasMatch(fullText[foundIndex - 1]);
        int endIndex = foundIndex + word.length;
        bool isEndBoundary = endIndex == fullText.length ||
            !RegExp(r'\w').hasMatch(fullText[endIndex]);

        if (!isStartBoundary || !isEndBoundary) {
          // Não é uma correspondência de palavra inteira, continuar buscando
          startIndex = foundIndex + 1;
          continue;
        }
      }

      if (foundIndex == -1) {
        break; // Nenhuma ocorrência encontrada
      }

      print('Found "$word" at index: $foundIndex');
      print(
          '${fullText.substring(0, foundIndex)}|${fullText.substring(foundIndex, foundIndex + word.length)}|${fullText.substring(foundIndex + word.length)}');

      int endIndex = foundIndex + word.length;

      // Aplica os atributos na ocorrência encontrada
      var (updatedSubTexts, remain) = setAttributesOnPosition(
        content,
        attributesAt,
        foundIndex,
        endIndex,
      );

      // Atualiza o conteúdo com os novos SubTexts
      content.subText = updatedSubTexts;

      // Texto não muda
      // Atualiza o texto completo para refletir as mudanças
      // fullText = content.subText!.map((e) => e.text).join();

      // Move o índice inicial para continuar a busca após a ocorrência atual
      startIndex = endIndex;
    }
    newContents.add(content.copyWith());
  }
  return newContents;
}

// void main() {
//   final subText1 = SubText('Olá, ', {'font': 'Arial'});
//   final subText2 = SubText('mundo!', {'font': 'Helvetica'});
//   final subText3 = SubText(' Como vai?', {'font': 'Verdana'});
//   // final subText1 = SubText('Olá', {'font': 'Arial'});
//   // final subText2 = SubText(' m', {'font': 'Helvetica'});
//   // final subText3 = SubText('un', {'font': 'Verdana'});
//   // final subText4 = SubText('do! Como', {'font': 'Verdana', 'bold': 'true'});
//   // final subText5 = SubText(' vai?\n Muito bem!', {'font': 'Calibre'});

//   var content = Content([subText1, subText2, subText3]);
//   // final content = Content([subText1, subText2, subText3, subText4, subText5]);
//   //com novas
//   setAttributesOnPosition(content, {'color': 'red'}, 2, 7); // OK

//   setAttributesOnPosition(content, {'color': 'red'}, 0, 2); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 12, 20); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 0, 6); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 0, 17); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 2, 4); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 0, 21); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 1, 3); // OK ==
//   setAttributesOnPosition(content, {'color': 'red'}, 3, 5); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 7, 15); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 6, 12); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 7, 14); // OK
//   setAttributesOnPosition(content, {'color': 'red'}, 2, 3); // OK

//   //novo teste em lista

//   final subText6 = SubText(' Aqui tudo bem,', {'font': 'Arial'});
//   final subText7 = SubText(' mas queria', {'font': 'Helvetica'});
//   final subText8 = SubText(' comer.', {'font': 'Verdana'});
//   final subText9 =
//       SubText(' Estou com uma fome!', {'font': 'Verdana', 'bold': 'true'});

//   final content2 = Content([subText6, subText7, subText8, subText9]);

//   List<Content> contents = [content, content2];

//   // setSubTextAttributes(content, {'color': 'red'}, 0, 2); //i==0
//   // setSubTextAttributes(content, {'color': 'red'}, 12, 20); //ver ordenaçao
//   // setSubTextAttributes(content, {'color': 'red'}, 15, 18); //i==t
//   // setSubTextAttributes(content, {'color': 'red'}, 19, 21); //i==t
//   // // setSubTextAttributes(content, {'color': 'red'}, 0, 6); //<i>
//   // // setSubTextAttributes(content, {'color': 'red'}, 0, 17); //<i>
//   // // setSubTextAttributes(content, {'color': 'red'}, 2, 7); //<i>
//   // // setSubTextAttributes(content, {'color': 'red'}, 2, 4); //<i>
//   // // setSubTextAttributes(content, {'color': 'red'}, 0, 21); //<i>
//   // setSubTextAttributes(content, {'color': 'red'}, 0, 30); // resta 9 para processar no proximo

//   // print(content.texts.toString());
//   // print('|${'Olá, mundo!'.substring(2, 4)}|');
// }

void main() {
  final subText1 = SubText(
    text: 'Olá, ',
    attributes: {'font': 'Arial'},
  ); // 0-5
  final subText2 = SubText(
    text: 'mundo!',
    attributes: {'font': 'Helvetica'},
  ); // 5-11
  final subText3 = SubText(
    text: ' Como vai?',
    attributes: {'font': 'Verdana'},
  ); // 11-21

  var content = Content(
      seq: 0,
      text: '',
      subText: [subText1, subText2, subText3],
      typeContent: TypeContent.verse);

  final subText6 = SubText(
    text: ' Aqui tudo bem,',
    attributes: {'font': 'Arial'},
  );
  final subText7 = SubText(
    text: ' mas queria',
    attributes: {'font': 'Helvetica'},
  );
  final subText8 = SubText(
    text: ' comer.',
    attributes: {'font': 'Verdana'},
  );
  final subText9 = SubText(
    text: ' Estou com uma fome!',
    attributes: {'font': 'Verdana'},
  );

  final content2 = Content(
      seq: 1,
      text: '',
      subText: [subText6, subText7, subText8, subText9],
      typeContent: TypeContent.verse);

  List<Content> contents = [content, content2];

  // Aplica atributo da posição 0 a 10 (afeta subText1 completo e parte do subText2)
  List<Content> updatedContents = [];
  // = setContentAttributesOnPosition(
  //   contents: contents,
  //   attributesAt: {'color': 'red'},
  //   initAt: 0,
  //   endAt: 10,
  // );
  imprimir() {
    print('Updated Contents:');
    int total = 0;
    for (var content in updatedContents) {
      print('Content:');
      for (var subText in content.subText!) {
        total += subText.text.length;
        print(
            '  $subText${List.generate(100 - subText.toString().length, (i) => ' ').join()}=> total chars: ${subText.length}  => cumulative total: $total ');
      }
    }
  }

  imprimir();

  // Aplica atributo que atravessa múltiplos conteúdos
  // updatedContents = setContentAttributesOnPosition(
  //   contents: contents,
  //   attributesAt: {'NOVO': 'VALOR'},
  //   initAt: 40,
  //   endAt: 43,
  //   // initAt: 13,
  //   // endAt: 17,
  //   // initAt: 40,
  //   // endAt: 47,
  // );
  updatedContents = setContentAttributesOnAWord(
      contents, {'HIGHLIGHT': 'TRUE'}, 'olá',
      filterBy: FilterWordBy(caseSensitive: true, wholeWord: true));
  imprimir();
}
