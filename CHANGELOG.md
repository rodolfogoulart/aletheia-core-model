## 0.0.1

* Creation of the package

## 0.0.2
* Fix model import

## 0.0.3
* enum translation strings

## 0.0.4
* add field [List<Reference>? references] to UserNotes
    * Field is used to store the references of the note

## 0.0.5
* changed the field tags [String?] on UserNotes to [List<String>? tags]

## 0.0.6
* Add [List<WordsHighlighted>? wordsHighlighted] to UserNotes
  * Add [WordsHighlighted] class
* verse folder for user

## 0.0.7
* Add [List<WordsHighlighted>? wordsHighlighted] to [VerseView]

## 0.0.8
* Add [highlight] type to the enum [TypeAttributes]

## 0.0.9
* Change the VerseView to use UserVerse, all fields will be on the class

## 0.0.10
* Add json generation to AnalizeGrammar
* Removed some old code

## 0.0.11
* Add [NlpVerse] class
* Add to BibleVersion field [hash]
  * Default value 'pt-br' to language
* Commentary on fields

## 0.0.12
* Fix field type on [hashBibleVersion] on [NlpVerse]

## 0.0.12
* change [analysisGrammar] on [NlpVerse] to [List<AnalizeGrammar>]

## 0.0.13
* add [WordPartOfSpeechView]
* add Enum to [WordPartOfSpeech] variables result 