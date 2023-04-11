import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfGenerator extends StatefulWidget {
  const PdfGenerator({super.key});

  @override
  State<PdfGenerator> createState() => PdfGeneratorState();
}

class PdfGeneratorState extends State<PdfGenerator> {
  Future<void> _IdCard(
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
    <div
      style="
        width: 600px;
        margin-left: 3px;
        margin-right: 3px;
        margin-top: 3px;
        margin-bottom: 3px;
        transform: scaleX(1);
      "
    >
      <div style="display: flex; text-align: left; padding: 5px">
        <span style="display: flex; flex-wrap: wrap; align-content: center;">
          <img src="$schoolLogo" alt="image" style="width: 100px" />
        </span>
        <div style="margin-left:10px">
          <p style="font-weight: bold; font-size: 1.25rem; margin-bottom: 1px">
            $schoolName
          </p>
          <p>$schoolAddress, &nbsp;Tel:$schoolPhone</p>
        </div>
      </div>
      <div
        style="
          height: 40px;
          background-color: #4a5568;
          text-align: center;
          padding-top: 2px;
        "
      >
        <span
          style="
            color: #fff;
            font-weight: 600;
            margin-left: 5px;
            margin-right: 5px;
            font-size: 1.25rem;
          "
        >
          ${"student's identity card".toUpperCase()}
        </span>
      </div>
      <div style="display: flex; gap: 5px; background-color: #f7fafc; margin-top:10px">
        <span style="margin-left: 5px; margin-top: 3px;">
          <img
            style="       
              width: 100px;
              object-fit:fill;  
            "
            src="$studentPhoto"
            alt="name"
          />
        </span>
        <div
          style="
            display: flex;
            gap: 5px;
            align-items: flex-start;
            padding-left: 5px;
            padding: 5px;
          "
        >
          <span className="">
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Student ID</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Name</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">DOB</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Class</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Section</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Roll</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Mobile No.</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">Validity</span>
            </p>
          </span>
          <span>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">: $studentId</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">: $studentName</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">
                : $studentDob
              </span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">: $studentClass</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">: $studentSection</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">: $studentRoll</span>
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">
                : $studentPhone </span
              >
            </p>
            <p style="margin-top: 1.5px; margin-bottom: 1.5px">
              <span style="font-weight: 500; color: #4b5563">
                : $cardValidity </span
              >
            </p>
          </span>
        </div>
      </div>

      <div
        style="
          height: 80px;
          display: flex;
          justify-content: space-between;
          align-items: center;
        "
      >
        <div
          style="
          display: flex;
          flex-direction: column;
            text-align: left;
            padding-left: 5px;
            padding-right: 5px;
            padding-bottom: 5px;
          "
        >
          <span style="padding-left: 5px; padding-right: 5px">
            <img
              src="$signature"
              alt="{signature?.name}"
              style="width: 90px; margin-left: 5px"
            />
          </span>
          <span
            style="
              border-style: solid;
              border-top-width: 1px;
              border-top-color: #000;
            "
          >
            Principal's Signature
          </span>
        </div>
        <span >
          <img
            src="$barCode"
            alt="bar"
            style="width: 150px; height: 40px; margin-right: 5px;"
          />
        </span>
      </div>
    </div>
  </body>
</html>
""";

    final Directory docDir = await getTemporaryDirectory();

    docDir.create(); //* creates the Documents folder if it does not exist.
    File generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
        format1, docDir.path, "Invoice");
    OpenFile.open(generatedPdfFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () {
                  _IdCard(
                    barCode:
                        "https://t3.ftcdn.net/jpg/04/55/48/06/360_F_455480661_B1ndlageM3kplzg1NRPFUgYj2iWXvDQS.jpg",
                    studentName: "Ram Adhikari",
                    cardValidity: "2080/12/31",
                    schoolAddress: "baneshwor",
                    schoolLogo:
                        "https://images.unsplash.com/photo-1599305445671-ac291c95aaa9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bG9nb3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
                    schoolName: "Sarathi english school",
                    schoolPhone: "+977-98123456",
                    studentClass: "1",
                    studentDob: "2057/12/11",
                    studentId: "163/075",
                    studentPhone: "981234568745",
                    studentPhoto:
                        "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                    studentRoll: "1",
                    studentSection: "A",
                    signature:
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Jon_Kirsch%27s_Signature.png/800px-Jon_Kirsch%27s_Signature.png?20100224042226",
                  );
                },
                child: const Text('Generate Id card 1'))));
  }
}
