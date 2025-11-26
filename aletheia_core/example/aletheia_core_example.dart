import 'package:aletheia_core/aletheia_core_model.dart';

void main() {
  print('Welcome to Aletheia Core');

  SubText subText1 =
      SubText(text: "In the beginning ", attributes: {"bold": true});
  SubText subText2 = SubText(text: "God", attributes: {"italic": true});
  SubText subText3 =
      SubText(text: " created the heavens and the earth.", attributes: {});

  List<SubText> subTexts = [subText1, subText2, subText3];

  // Example: Add underline attribute from position 3 to 25
  final updatedSubTexts =
      addAttributeToSubText(subTexts, 3, 25, {"underline": true});

  for (var subText in updatedSubTexts) {
    print('Text: "${subText.text}", Attributes: ${subText.attributes}');
  }
}

/// Add attribute into a list of Content from startAt to endAt, where startAt and endAt are the positions of the text inside the SubText list.
addAttributeToContent(List<Content> listContents, int startAt, int endAt,
    Map<String, dynamic> attribute) {}

/// Add attribute into a list of SubText from startAt to endAt, where startAt and endAt are the positions of the text inside the SubText list.
///
/// This read the SubText list get the positions and add the attribute to the SubText attributes map.
///
/// If the SubText already has attributes, it will merge the new attribute with the existing ones.
///
/// If the text range spans multiple SubText, it will add the attribute to all SubText in the range.
///
/// If the text range is within a single SubText, it will add the attribute only to that SubText.
///
/// If the text range starts or ends in the middle of a SubText, it will split the SubText into two parts and add the attribute to the relevant part.
List<SubText> addAttributeToSubText(List<SubText> listTexts, int startAt,
    int endAt, Map<String, dynamic> attribute) {
  List<SubTextPosition> positions = [];
  int currentPos = 0;

  print('startAt: $startAt, endAt: $endAt');
  for (var subText in listTexts) {
    positions.add(SubTextPosition(
      start: currentPos,
      end: subText.length +
          currentPos -
          1, // -1 because start at 0 and length at 1
      subText: subText,
    ));
    currentPos += subText.length;
    print(
        'Positions: start=${positions.last.start}, end=${positions.last.end}.   => Text="${subText.text}"');
  }
  List<SubTextPosition> newPositions = [];
  // Merge attributes with existing ones
  for (var pos in positions) {
    // If the range is completely within a SubText, add the attribute to that SubText
    if (pos.start >= startAt && pos.end <= endAt) {
      pos.subText.attributes ??= {};
      pos.subText.attributes!.addAll(attribute);

      newPositions.add(pos);
      continue;
    }
    // se o range começa ou termina no meio de um SubText, ele irá dividir o SubText
    // em duas partes, e adicionar o atributo à parte do SubText que está dentro do range.
    else if (pos.start < startAt && pos.end >= startAt && pos.end <= endAt) {
      // Divide o SubText em duas partes
      // Nova parte com o atributo que comprende o range
      var newSubText = SubText(
        text: pos.subText.text.substring(startAt - pos.start),
        attributes: Map.from(attribute),
      );
      // Parte original sem o atributo
      pos.subText.text = pos.subText.text.substring(0, startAt - pos.start);
      pos.subText.attributes ??= {};

      // Adiciona ao newPositions, mas na ordem correta
      newPositions.add(SubTextPosition(
        start: pos.start,
        end: startAt - 1,
        subText: pos.subText,
      ));
      // Nova parte com o atributo que comprende o range
      newPositions.add(SubTextPosition(
        start: startAt,
        end: newSubText.length + startAt - 1,
        subText: newSubText,
      ));

      continue;
    } else if (pos.start >= startAt && pos.end > endAt) {
      // Split the SubText into two parts
      var newSubText = SubText(
        text: pos.subText.text.substring(0, endAt - pos.start),
        attributes: Map.from(attribute),
      );
      pos.subText.text = pos.subText.text.substring(endAt - pos.start);
      pos.subText.attributes ??= {};
      pos.subText.attributes!.addAll(attribute);

      newPositions.add(SubTextPosition(
        start: pos.start,
        end: endAt,
        subText: newSubText,
      ));

      continue;
    } else if (pos.start < startAt && pos.end > endAt) {
      // Split the SubText into two parts
      var newSubText = SubText(
        text:
            pos.subText.text.substring(startAt - pos.start, endAt - pos.start),
        attributes: Map.from(attribute),
      );
      pos.subText.text = pos.subText.text.substring(0, startAt - pos.start);
      pos.subText.attributes ??= {};
      pos.subText.attributes!.addAll(attribute);
      positions.add(SubTextPosition(
        start: endAt - pos.start,
        end: pos.end - pos.start,
        subText: newSubText,
      ));
      continue;
    }
    //
    newPositions.addAll(positions);
  }

  List<SubText> finalTexts = [];
  for (var pos in newPositions) {
    finalTexts.add(pos.subText);
  }

  return finalTexts;
}

class SubTextPosition {
  int start;
  int end;
  SubText subText;
  SubTextPosition({
    required this.start,
    required this.end,
    required this.subText,
  });
}
