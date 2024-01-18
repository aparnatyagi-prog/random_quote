import "dart:math";

import "package:random_quote/core/util/color_constant.dart";

T getRandomQuote<T>(List<T> list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}
 getRandomBackgroundColor() {
   final random = Random();
   var i = random.nextInt(randomColorList.length);
   return randomColorList[i];
 }
getRandomTextColor() {
  final random = Random();
  var i = random.nextInt(textColorList.length);
  return randomColorList[i];
}