import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfApi {
  static Future<String> saveDocument({
    required String name,
    required List<int> bytes,
  }) async {
    final List<Directory>? dir = await getExternalStorageDirectories();
    String filePath = "";
    if (dir != null) {
      Directory tempDir = dir[0].parent.parent.parent.parent;
      Directory docDir = Directory("${tempDir.path}/Documents");
      docDir.create(); //* creates the Documents folder if it does not exist.
      final File file = File('${docDir.path}/$name');
      final File finalFile =
          await file.writeAsBytes(bytes, flush: true, mode: FileMode.write);
      debugPrint("file path:-${finalFile.path}");
      filePath = finalFile.path;
    }
    return filePath;
  }

  static void openFile(String fileUrl) async {
    debugPrint("file path:-$fileUrl");
    await OpenFile.open(fileUrl);
  }
}
