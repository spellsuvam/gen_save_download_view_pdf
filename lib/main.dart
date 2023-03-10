import 'package:flutter/material.dart';
import 'package:pdf_generator/file_downloader.dart';
import 'package:pdf_generator/pdf_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FileDownloader(),
    );
  }
}
