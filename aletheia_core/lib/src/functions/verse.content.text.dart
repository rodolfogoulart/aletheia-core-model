// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
// ignore_for_file: omit_local_variable_types

import 'dart:convert';

import 'package:aletheia_core/aletheia_core.dart';

// class SubText {
//   String text;
//   Map<String, dynamic> attributes;
//   SubText({required this.text,required this.attributes});

//   @override
//   String toString() => 'SubText(text: $text, attributes: $attributes)';
// }

// class Content {
//   List<SubText> subText;
//   Content(this.subText);

//   Content copyWith({
//     List<SubText>? subText,
//   }) {
//     return Content(
//       subText ?? this.subText,
//     );
//   }
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

class ContentTextFormatter {
  ContentTextFormatter();

  /// Aplica atributos em uma lista de Contents baseado em posições globais
  ///
  /// [contents]: Lista de Contents a serem modificados
  ///
  /// [attributesAt]: Atributos a serem aplicados
  ///
  /// [initAt]: Posição inicial global para aplicar os atributos
  ///
  /// [endAt]: Posição final global para aplicar os atributos
  static List<Content> setContentAttributesOnPosition({
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
      int contentLength = currentContent.texts!
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
        int localEnd =
            endAt >= contentEnd ? contentLength : endAt - contentStart;

        print(
            'Processing Content $i: globalPos=$globalPosition, contentStart=$contentStart, contentEnd=$contentEnd');
        print(
            '  Local range: $localStart to $localEnd (global: $initAt to $endAt)');

        // Aplica os atributos neste conteúdo
        var updatedSubTexts = setAttributesOnPosition(
          currentContent,
          attributesAt,
          //localStart calculado acima
          localStart,
          //localEnd calculado acima
          localEnd,
        );

        // Atualiza o conteúdo com os novos SubTexts
        updatedContents.add(currentContent..texts = updatedSubTexts);
      } else {
        // Este conteúdo não é afetado, mantém como está
        updatedContents.add(currentContent);
      }

      globalPosition += contentLength;
    }

    return updatedContents;
  }

  /// Aplica atributos em todas as ocorrências de uma palavra em uma lista de Contents
  ///
  /// [contents]: Lista de Contents a serem modificados
  ///
  /// [attributesAt]: Atributos a serem aplicados
  ///
  /// [word]: Palavra a ser buscada e modificada
  ///
  static List<Content> setContentAttributesOnAWord(
    List<Content> contents,
    Map<String, dynamic> attributesAt,
    String word, {
    FilterWordBy? filterBy,
  }) {
    filterBy ??= FilterWordBy();

    List<Content> newContents = [];
    //
    for (var content in contents) {
      String fullText = content.texts!.map((e) => e.text).join();
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
        var updatedSubTexts = setAttributesOnPosition(
          content,
          attributesAt,
          foundIndex,
          endIndex,
        );

        // Atualiza o conteúdo com os novos SubTexts
        content.texts = updatedSubTexts;

        // Texto não muda
        // fullText = content.subText!.map((e) => e.text).join();

        // Move o índice inicial para continuar a busca após a ocorrência atual
        startIndex = endIndex;
      }
      newContents.add(content.copyWith());
    }
    return newContents;
  }

  /// Aplica atributos em um Content baseado em posições locais
  ///
  /// [content]: Content a ser modificado
  ///
  /// [attributesAt]: Atributos a serem aplicados
  ///
  /// [initAt]: Posição inicial local para aplicar os atributos
  ///
  /// [endAt]: Posição final local para aplicar os atributos
  ///
  /// Retorna a nova lista de SubTexts com os atributos aplicados
  ///
  /// Observação: As posições initAt e endAt são relativas ao conteúdo do Content fornecido
  ///
  /// Exemplo:
  ///```dart
  /// final subText1 = SubText('Olá, ', {'font': 'Arial'});
  /// final subText2 = SubText('mundo!', {'font': 'Helvetica'});
  /// final subText3 = SubText(' Como vai?', {'font': 'Verdana'});
  /// var content = Content([subText1, subText2, subText3]);
  /// content = setAttributesOnPosition(content, {'NOVO': 'VALOR'}, 2, 7);
  /// // Resultado:
  /// // SubText(text: [Ol], attributes: {font: Arial})
  /// // SubText(text: [á, ], attributes: {font: Arial, NOVO: VALOR})
  /// // SubText(text: [mu], attributes: {font: Helvetica, NOVO: VALOR})
  /// // SubText(text: [ndo!], attributes: {font: Helvetica})
  /// // SubText(text: [ Como vai?], attributes: {font: Verdana})
  /// ```
  ///
  static List<Texts> setAttributesOnPosition(Content content,
      Map<String, dynamic> attributesAt, int initAt, int endAt) {
    // Construir texto completo e mapa de posições
    String fullText = '';
    List<AttributesPosition> positions = [];

    for (var subText in content.texts!) {
      int start = fullText.length;
      fullText += subText.text;
      int end = fullText.length;

      positions.add(AttributesPosition(
        attributes: Map<String, dynamic>.from(subText.attributes ?? {}),
        start: start,
        end: end,
      ));
    }

    // Validar limites
    if (initAt < 0) initAt = 0;
    if (endAt > fullText.length) {
      endAt = fullText.length;
    }

    // Lista de novas posições
    List<AttributesPosition> newPositions = [];

    for (var pos in positions) {
      // Caso 1: Posição completamente fora do range
      if (pos.end <= initAt || pos.start >= endAt) {
        newPositions.add(pos);
        continue;
      }

      // Caso 2: Posição completamente dentro do range
      if (pos.start >= initAt && pos.end <= endAt) {
        newPositions.add(AttributesPosition(
          attributes: {...pos.attributes, ...attributesAt},
          start: pos.start,
          end: pos.end,
        ));
        continue;
      }

      // Caso 3: Range começa no meio da posição
      if (pos.start < initAt && pos.end > initAt) {
        // Parte antes do range
        newPositions.add(AttributesPosition(
          attributes: pos.attributes,
          start: pos.start,
          end: initAt,
        ));

        // Parte dentro do range
        int rangeEnd = pos.end < endAt ? pos.end : endAt;
        newPositions.add(AttributesPosition(
          attributes: {...pos.attributes, ...attributesAt},
          start: initAt,
          end: rangeEnd,
        ));

        // Parte depois do range (se existir)
        if (pos.end > endAt) {
          newPositions.add(AttributesPosition(
            attributes: pos.attributes,
            start: endAt,
            end: pos.end,
          ));
        }
        continue;
      }

      // Caso 4: Range termina no meio da posição
      if (pos.start < endAt && pos.end > endAt) {
        // Parte dentro do range
        newPositions.add(AttributesPosition(
          attributes: {...pos.attributes, ...attributesAt},
          start: pos.start,
          end: endAt,
        ));

        // Parte depois do range
        newPositions.add(AttributesPosition(
          attributes: pos.attributes,
          start: endAt,
          end: pos.end,
        ));
        continue;
      }
    }

    // Reconstruir SubTexts
    List<Texts> subTexts = [];
    for (var pos in newPositions) {
      String text = fullText.substring(pos.start, pos.end);
      subTexts.add(Texts(text: text, attributes: pos.attributes));
    }

    return subTexts;
  }

  /// Obtém as posições de todas as ocorrências de uma palavra em uma lista de Contents
  ///
  /// [content]: Lista de Contents a serem pesquisados
  ///
  /// [word]: Palavra a ser buscada
  ///
  /// [filterBy]: Filtros para busca da palavra
  ///
  static List<int> getPositionOfWordInContent(
    List<Content> content,
    String word, {
    FilterWordBy? filterBy,
  }) {
    filterBy ??= FilterWordBy();

    String fullText =
        content.map((c) => c.texts!.map((e) => e.text).join()).join();
    // Ajusta a palavra e o texto completo conforme a sensibilidade de caso
    if (filterBy.caseSensitive == false) {
      word = word.toLowerCase();
      fullText = fullText.toLowerCase();
    }
    int startIndex = 0;
    print('----------getPositionOfWordInContent----------');
    print('Full text: $fullText');

    List<int> positions = [];

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
          '    ${fullText.substring(0, foundIndex)}|${fullText.substring(foundIndex, foundIndex + word.length)}|${fullText.substring(foundIndex + word.length)}');

      positions.add(foundIndex);

      // Move o índice inicial para continuar a busca após a ocorrência atual
      startIndex = foundIndex + word.length;
    }
    print('----------------------------------------------');
    return positions;
  }
}

/// Exemplo de uso
void main() {
  final subText1 = Texts(
    text: 'Olá, ',
    attributes: {'font': 'Arial'},
  ); // 0-5
  final subText2 = Texts(
    text: 'mundo!',
    attributes: {'font': 'Helvetica'},
  ); // 5-11
  final subText3 = Texts(
    text: ' Como vai?',
    attributes: {'font': 'Verdana'},
  ); // 11-21

  var content = Content(
      seq: 0,
      text: '',
      texts: [subText1, subText2, subText3],
      typeContent: TypeContent.verse);

  final subText6 = Texts(
    text: ' Aqui tudo bem,',
    attributes: {'font': 'Arial'},
  );
  final subText7 = Texts(
    text: ' mas queria',
    attributes: {'font': 'Helvetica'},
  );
  final subText8 = Texts(
    text: ' comer.',
    attributes: {'font': 'Verdana'},
  );
  final subText9 = Texts(
    text: ' Estou com uma fome!',
    attributes: {'font': 'Verdana'},
  );

  final content2 = Content(
      seq: 1,
      text: '',
      texts: [subText6, subText7, subText8, subText9],
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
      for (var textCurrent in content.texts!) {
        total += textCurrent.text.length;
        print(
            '  $textCurrent${List.generate(100 - textCurrent.toString().length, (i) => ' ').join()}=> total chars: ${textCurrent.length}  => cumulative total: $total ');
      }
    }
  }

  imprimir();

  List<int> positions = ContentTextFormatter.getPositionOfWordInContent(
    contents,
    'com',
    filterBy: FilterWordBy(caseSensitive: true, wholeWord: false),
  );

  // Aplica atributo que atravessa múltiplos conteúdos
  updatedContents = ContentTextFormatter.setContentAttributesOnPosition(
    contents: contents,
    attributesAt: {'NOVO': 'VALOR'},
    // initAt: 15,
    // endAt: 60,
    // initAt: 13,
    // endAt: 17,
    initAt: 61,
    endAt: 61 + 3,
  );
  updatedContents = ContentTextFormatter.setContentAttributesOnAWord(
    contents,
    {'HIGHLIGHT': 'TRUE'},
    'com',
    filterBy: FilterWordBy(caseSensitive: true, wholeWord: false),
  );
  imprimir();
}
