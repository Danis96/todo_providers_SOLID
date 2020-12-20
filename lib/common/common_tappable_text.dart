import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class TappableText extends StatelessWidget {
  const TappableText({
    @required this.text,
    @required this.links,
    this.onPressed,
    this.defaultStyle = const TextStyle(color: Color.fromRGBO(59, 72, 86, 1.0), fontSize: 16, fontWeight: FontWeight.w400),
    this.linkStyle = const TextStyle(color: Color.fromRGBO(81, 172, 252, 1.0), fontSize: 16, fontWeight: FontWeight.w500),
    this.textAlign = TextAlign.center,
  });

  /// Full text to display with links, example: 'Example link and url'
  final String text;

  /// Links in text order, examples: 'link', 'link#url'
  /// Multiple links are separated by #
  final String links;
  final Function(int) onPressed;
  final TextStyle defaultStyle;
  final TextStyle linkStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> _generateContent() {
      if (links.isEmpty) {
        return <TextSpan>[
          TextSpan(text: text),
        ];
      }

      final List<TextSpan> wContent = <TextSpan>[];
      final List<String> arrLinks = links.split('#');
      int tIndex = 0;

      for (int i = 0; i < arrLinks.length; i++) {
        final String link = arrLinks[i];
        if (text.contains(link)) {
          final int startIndex = text.indexOf(link);
          wContent.add(TextSpan(text: text.substring(tIndex, startIndex)));
          wContent.add(
            TextSpan(
              text: link,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (onPressed != null) {
                    onPressed(i);
                  }
                },
            ),
          );
          tIndex = startIndex + link.length;
        }
      }
      if (tIndex < text.length) {
        wContent.add(TextSpan(text: text.substring(tIndex, text.length)));
      }
      return wContent;
    }

    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: _generateContent(),
      ),
      textAlign: textAlign,
    );
  }
}
