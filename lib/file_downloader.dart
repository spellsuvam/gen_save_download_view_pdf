import 'dart:io';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';

class FileDownloader extends StatefulWidget {
  const FileDownloader({super.key});

  @override
  State<FileDownloader> createState() => _FileDownloaderState();
}

class _FileDownloaderState extends State<FileDownloader> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<bool> saveFile(String url, String fileName) async {
    log("a");
    String pathToSaveFile = "";
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        log("android");
        if (await _requestPermission(Permission.manageExternalStorage)) {
          log("has permission");
          // final List<Directory>? dir = await getExternalStorageDirectories();
          directory = await getTemporaryDirectory();
          if (directory != null) {
            log("has directories.");
            // Directory tempDir = dir[0];
            // Directory tempDir = dir[0].parent.parent.parent.parent;
            // log(tempDir.toString());
            // directory = Directory(tempDir.toString());
            log(directory.path);
            await directory.create(recursive: true).then((value) async {
              if (await value.exists()) {
                File saveFile = File("${value.path}/$fileName");
                pathToSaveFile = saveFile.path;
                log(pathToSaveFile);
              }
            });
          } else {
            log("has no directories.");
            return false;
          }
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }

      if (await directory.exists() && pathToSaveFile != "") {
        log("file path exists.");
        await dio.download(url, pathToSaveFile,
            onReceiveProgress: (received, total) {
          log("downloading");
          if (total != -1) {
            log("${(received / total * 100).toStringAsFixed(0)}%");
          }
          setState(() {
            progress = received / total;
          });
        });
        if (!await FlutterFileDialog.isPickDirectorySupported()) {
          print("Picking directory not supported");
          return false;
        }

        final pickedDirectory = await FlutterFileDialog.pickDirectory();

        if (pickedDirectory != null) {
          log(lookupMimeType(pathToSaveFile).toString());
          final filePath = await FlutterFileDialog.saveFileToDirectory(
            directory: pickedDirectory,
            data: File(pathToSaveFile).readAsBytesSync(),
            fileName: fileName,
            mimeType: lookupMimeType(pathToSaveFile),
            replace: true,
          );
        } else {
          print("Picked directory is null");
          return false;
        }
        // if (Platform.isIOS) {
        //   await ImageGallerySaver.saveFile(saveFile.path,
        //       isReturnPathOfIOS: true);
        // }
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  downloadFile(String url) async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveFile(url, getFileNameFromUrl(url));
    if (downloaded) {
      log("File Downloaded");
    } else {
      log("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  String getFileNameFromUrl(String url) {
    return url.split("/").last;
  }

  String imageFileUrl =
      "https://i0.wp.com/calmatters.org/wp-content/uploads/2022/04/20220301_Nevada_City_High_School_SW_CM_0805.jpg";

  String videoFileUrl =
      "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4";
  String pdfFileUrl =
      "https://www.oecd.org/education/2030-project/teaching-and-learning/learning/student-agency/Student_Agency_for_2030_concept_note.pdf";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: progress,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      getFileNameFromUrl(videoFileUrl),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                      icon: const Icon(
                        Icons.download_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        downloadFile(videoFileUrl);
                      },
                      label: const Text(
                        "Download",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ],
              ),
      ),
    );
  }
}
