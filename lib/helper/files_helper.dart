import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FilesHelper {
  FilesHelper._();
  static FilesHelper filesHelper = FilesHelper._();
  writeInFile(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    // String filePath = directory.path + '/$fileName.text';
    String filePath = join(directory.path, fileName + '.text');
    //TODO: create the path
    File file = File(filePath);
    file.writeAsString('Hello from the other side');
  }

  Future<String> readFromFile(String fileName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    //TODO: get that file path
    // String filePath = directory.path + '/$fileName.text';
    String filePath = join(directory.path, fileName + '.text');
    // File(filePath).readAsString();

    File file = File(filePath);
    String fileContent = await file.readAsString();
  }
}
