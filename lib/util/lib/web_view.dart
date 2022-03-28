import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebUtil {
  static void loadHtmlFromAssets(
    WebViewController controller,
    String path, {
    required String replacingPattern,
    required String replacingString,
  }) async {
    String fileText = await rootBundle.loadString(path);

    if (replacingString != null &&
        replacingPattern != null &&
        replacingPattern.isNotEmpty &&
        replacingString.isNotEmpty) {
      fileText = fileText.replaceAll(replacingPattern, replacingString);
    }

    controller.loadUrl(
      Uri.dataFromString(
        fileText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString(),
    );
  }

  static void loadHtmlFromText(
    WebViewController controller,
    String htmlText, {
    required String replacingPattern,
    required String replacingString,
  }) async {
    if (replacingString != null &&
        replacingPattern != null &&
        replacingPattern.isNotEmpty &&
        replacingString.isNotEmpty) {
      htmlText = htmlText.replaceAll(replacingPattern, replacingString);
    }

    controller.loadUrl(
      Uri.dataFromString(
        htmlText,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString(),
    );
  }
}
