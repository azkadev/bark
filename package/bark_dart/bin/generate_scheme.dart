import 'dart:io';

import 'package:galaxeus_lib/galaxeus_lib.dart';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  List<Map> datas = [
    {
      "@type": "ok",
    },
    {
      "@type": "error",
      "message": "",
      "description": "",
    },
    {
      "@type": "createSpeech",
      "text": "",
    }
  ];
  await jsonToScripts(datas, directory: Directory(path.join(Directory.current.path, "lib", "scheme")));
}
