import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> admitCard(
    {required String studentName,
    required String schoolName,
    required String schoolAddress,
    required String schoolPhone,
    required String studentId,
    required String studentDob,
    required String studentClass,
    required String studentSection,
    required String studentRoll,
    required String studentPhone,
    required String cardValidity,
    required String studentPhoto,
    required String schoolLogo,
    required String barCode,
    required String signature}) async {
  var format1 = """
<!DOCTYPE html>
<html>
  <head>
    
  </head>
  <body>
     
              <div style="margin-top: 1.5rem;">
  <div style="border: 1px solid black; border-radius: 0.5rem; overflow-x: auto; background-color: #cbd5e0; width: 75%; box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);">
    <div style="display: inline-block; width: 100%; vertical-align: middle;">
      <div style="width: 100%; border-radius: 0.5rem;">
        <div style="display: flex; justify-content: center; padding: 1.25rem;">
          <span>
            <img src=$schoolLogo alt="image" style="width: 100px;">
          </span>
          <div style="">
            <p style="font-weight: 700; font-size: 1.5rem;">
              $schoolName
            </p>
            <p>
              &nbsp;&nbsp;$schoolAddress, Tel:$schoolPhone
            </p>
          </div>
        </div>
        <div style="display: flex; gap: 1.25rem; padding: 1.25rem 1.25rem 0 1.25rem;">
          <span style="">
            <img src=$studentPhoto alt="image" style="width: 100px; margin-top: 0.5rem;">
          </span>
          <div style="">
            <button style="background-color: #4a5568; color: white; padding: 0.25rem; cursor: none;">
              Admit Card
            </button>
            <p style="margin: 0.5rem 0;">
              <span style="font-weight: 500; color: #4a5568;">
                Name:
              </span>
              &nbsp;&nbsp;$studentName
            </p>
            <p style="margin: 0.5rem 0;">
              <span style="font-weight: 500; color: #4a5568;">
                Class:
              </span>
              &nbsp;&nbsp;$studentClass
            </p>
            <p style="margin: 0.5rem 0;">
              <span style="font-weight: 500; color: #4a5568;">
                Section:
              </span>
              &nbsp;&nbsp;$studentSection
            </p>
            <p style="margin: 0.5rem 0;">
              <span style="font-weight: 500; color: #4a5568;">
                Roll:
              </span>
              &nbsp;&nbsp;$studentRoll
            </p>
          </div>
        </div>
        <div style="text-align: right; padding: 1.25rem;">
          <span style="padding-left: 2.5rem;">
            <img src=$signature alt="principal signature" style="width: 90px; margin-left: auto;">
          </span>
          <span style="border-style: solid; border-top-width: 1px; border-color: black; display: inline-block; padding-left: 0.5rem; margin-left: 2rem;">
            Principal Signature
          </span>
        </div>
      </div>
    </div>
  </div>
</div>
            
  </body>
</html>
""";

  final Directory docDir = await getTemporaryDirectory();

  docDir.create(); //* creates the Documents folder if it does not exist.
  File generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
      format1, docDir.path, "Admit Card");
  OpenFile.open(generatedPdfFile.path);
}
