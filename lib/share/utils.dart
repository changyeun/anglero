import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:styled_text/styled_text.dart';

class AngleroText extends StatelessWidget {
  AngleroText(this.text,
      {Key? key,
        this.style = const TextStyle(color: Colors.black),
        this.emStyle = const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        this.customStyle = const TextStyle(),
        this.maxLines,
        this.textAlign = TextAlign.start,
        this.wordBreak = false,
        this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);

  String text;

  TextStyle? style;
  TextStyle? emStyle;
  TextStyle? customStyle;

  bool wordBreak;

  int? maxLines;
  TextAlign textAlign;
  TextOverflow textOverflow;
  var tags;

  @override
  Widget build(BuildContext context) {
    text = text.replaceAll('/n', '\n');
    if (wordBreak) {
      text = text.kjc();
    }

    tags = {
      'em': StyledTextTag(style: emStyle),
      'custom': StyledTextTag(style: customStyle),
    };

    if (maxLines == null) {
      return StyledText(
        text: text,
        style: style,
        tags: tags,
        textAlign: textAlign,
      );
    } else {
      return StyledText(
        text: text,
        style: style,
        tags: tags,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: textOverflow,
      );
    }
  }
}

extension RetinolString on String {
  String kjc() {
    String breakWord = '';
    runes.forEach((element) {
      if (!exceptionChar.contains(element)) {
        //띄어쓰기
        if (element == 32) {
          breakWord += String.fromCharCode(element);
          breakWord += '\u200b';
        } else {
          breakWord += String.fromCharCode(element);
          breakWord += '\ufeff';
        }
      } else {
        breakWord += String.fromCharCode(element);
      }
    });
    return breakWord;
  }

//TODO
// //괄호 단위로만 떨어지도록
// < ( { [ 앞 글자에 \ufeff를 붙여야함
// String bracket() {
//   String breakWord = '';
//   runes.forEach((element) {
//     if (!enChar.contains(element)) {
//       //띄어쓰기, 괄호
//       if (bracketChar.contains(element)) {
//         breakWord += String.fromCharCode(element);
//         breakWord += '\u200b';
//       } else {
//         breakWord += String.fromCharCode(element);
//         breakWord += '\ufeff';
//       }
//     } else {
//       breakWord += String.fromCharCode(element);
//     }
//   });
//   return breakWord;
// }
}

List<int> exceptionChar = [
  60,
  62,
  47,
  65,
  66,
  67,
  68,
  69,
  70,
  71,
  72,
  73,
  74,
  75,
  76,
  77,
  78,
  79,
  80,
  81,
  82,
  83,
  84,
  85,
  86,
  87,
  88,
  89,
  90,
  97,
  98,
  99,
  100,
  101,
  102,
  103,
  104,
  105,
  106,
  107,
  108,
  109,
  110,
  111,
  112,
  113,
  114,
  115,
  116,
  117,
  118,
  119,
  120,
  121,
  122
];