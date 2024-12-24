// import 'dart:convert';

// class HotFix {
//   String? lastHotFix;
//   HotFix({
//     this.lastHotFix,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'lastHotFix': lastHotFix,
//     };
//   }

//   factory HotFix.fromMap(Map<String, dynamic> map) {
//     return HotFix(
//       lastHotFix: map['lastHotFix'] != null ? map['lastHotFix'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory HotFix.fromJson(String source) => HotFix.fromMap(json.decode(source) as Map<String, dynamic>);
// }

abstract class InterfaceControllerHotFix {
  ///get the version string and convert to double
  ///
  ///example: 1.0.12 => 1012
  versionToDouble(String version);

  ///return true if need hotfix
  ///
  ///check if has file hotfix and if the last version of hotfix applyed is the same or greater
  checkForHotFix();
}
