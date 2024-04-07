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

## 0.0.14
* Add to Export
* Add Extensions for Enum
* Add commentary on enum
* Add Enum to [WordDependencyEdge] variables result

## 0.0.15
* Add Extension for [TypeWordDependencyEdgeLabel]
* Add title to all type.word.part.of.speech Enums

## 0.0.16
* Add Custom Extension for Enum
* Add AnalizeText (Response from Google cloud NLP)

## 0.0.17
* Add NlpChapter
* Deprecated NlpVerse (to remove next version of bible aletheia)

## 0.0.18
* Fix parser fromMap

## 0.0.19
* Fix parser fromMap for Enum

## 0.0.20
* Remove NlpVerse

## 0.0.21
* Add List<Reference>? references; to UserVerse
  * User can add personal references to verse
* Add String? description; to References
  * Can be used to store some information about the reference

## 0.0.22
* Add interface for the repository. This will create a interface between the repository and the database acess


## 0.0.23
* Upgrade pubspec
  * Upgrade sdk version

## 0.0.24
* add Equalizer to BookView

## 0.0.25
* Add searchVerse on RepositoryVerse
  * Search for words on verse, 
    * filter by: division? book? bibleVersion?
    * limit request and do pagination

## 0.0.26
* Add to TypeAttributes {underlineColor,  underlineThickness,  underlineStyle} 