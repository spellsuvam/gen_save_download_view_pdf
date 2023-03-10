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
  Future<void> _admitCard1(
      {required String examName, required String studentName}) async {
    var htmlContent = """
<!DOCTYPE html><html><head><link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
</head>
<body>
<div class="v1_6">
<div class="v1_7">
</div><div class="v1_8">
<div class="v1_9">
</div>
</div>
<div class="v1_10">
<div class="v1_11">
<span class="v1_12">Amrit college of science and technology</span>
<span class="v1_13">Narephat koteswor, Kathmandu</span>
</div><div class="v1_14"><span class="v1_15">Tel : +977 580601</span><div class="v1_16">
<span class="v1_17">/</span><span class="v1_18">+977 9808080800</span></div>
</div></div><div class="v1_19"></div><div class="v1_20"><div class="v1_21">
<div class="v1_22"><span class="v1_23">Name</span><span class="v1_24">: Ranjit Shrestha </span>
</div><div class="v1_25"><span class="v1_26">: 12 - Science - Biology </span>
<span class="v1_27">Class </span></div><div class="v1_28"><span class="v1_29">: B</span>
<span class="v1_30">Section</span></div><div class="v1_31"><span class="v1_32">: 12356</span><span class="v1_33">Roll no.</span>
</div></div><div class="v1_34"><div class="v1_35"></div><span class="v1_36">Admit Card</span></div></div><div class="v1_37">
<span class="v1_38">Principle Signature</span><div class="name"></div></div></div></body></html> 
<br/><br/> 
<style>* {
  box-sizing: border-box;
}
body {
  font-size: 14px;
}
.v1_6 {
  width: 325px;
  height: 180px;
  background: url("../images/v1_6.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v1_7 {
  width: 325px;
  height: 180px;
  background: rgba(244,247,251,1);
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  border: 1px solid rgba(25,38,56,1);
  border-top-left-radius: 12px;
  border-top-right-radius: 12px;
  border-bottom-left-radius: 12px;
  border-bottom-right-radius: 12px;
  overflow: hidden;
}
.v1_8 {
  width: 325px;
  height: 180px;
  background: url("../images/v1_8.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 12px;
  left: 12px;
  overflow: hidden;
}
.v1_9 {
  width: 30px;
  height: 30px;
  background: url("../images/v1_9.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v1_10 {
  width: 249px;
  height: 29px;
  background: url("../images/v1_10.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 11px;
  left: 48px;
  overflow: hidden;
}
.v1_11 {
  width: 205px;
  height: 29px;
  background: url("../images/v1_11.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v1_12 {
  width: 205px;
  color: rgba(25,38,56,1);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Bold;
  font-size: 10px;
  opacity: 1;
  text-align: left;
}
.v1_13 {
  width: 106px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 16px;
  left: 0px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 7px;
  opacity: 1;
  text-align: left;
}
.v1_14 {
  width: 132px;
  height: 13px;
  background: url("../images/v1_14.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  margin: 3px;
  opacity: 1;
  position: absolute;
  top: 16px;
  left: 114px;
  overflow: hidden;
}
.v1_15 {
  width: 60px;
  color: rgba(25,38,56,1);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 7px;
  opacity: 1;
  text-align: left;
}
.v1_16 {
  width: 69px;
  height: 13px;
  background: url("../images/v1_16.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 0px;
  left: 64px;
  overflow: hidden;
}
.v1_17 {
  width: 3px;
  color: rgba(25,38,56,1);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 7px;
  opacity: 1;
  text-align: left;
}
.v1_18 {
  width: 63px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 1px;
  left: 7px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 7px;
  opacity: 1;
  text-align: left;
}
.v1_19 {
  width: 70px;
  height: 88px;
  background: rgba(217,217,217,1);
  opacity: 1;
  position: absolute;
  top: 52px;
  left: 12px;
  border: 1.128260850906372px solid rgba(25,38,56,1);
  border-top-left-radius: 1px;
  border-top-right-radius: 1px;
  border-bottom-left-radius: 1px;
  border-bottom-right-radius: 1px;
  overflow: hidden;
}
.v1_20 {
  width: 151px;
  height: 78px;
  background: url("../images/v1_20.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 52px;
  left: 91px;
  overflow: hidden;
}
.v1_21 {
  width: 151px;
  height: 58px;
  background: url("../images/v1_21.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 20px;
  left: 1px;
  overflow: hidden;
}
.v1_22 {
  width: 122px;
  height: 13px;
  background: url("../images/v1_22.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v1_23 {
  width: 26px;
  color: rgba(25,38,56,1);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Semi Bold;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_24 {
  width: 70px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 52px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_25 {
  width: 151px;
  height: 13px;
  background: url("../images/v1_25.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 15px;
  left: 0px;
  overflow: hidden;
}
.v1_26 {
  width: 99px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 52px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_27 {
  width: 25px;
  color: rgba(25,38,56,1);
  position: relative;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Semi Bold;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_28 {
  width: 63px;
  height: 13px;
  background: url("../images/v1_28.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 30px;
  left: 0px;
  overflow: hidden;
}
.v1_29 {
  width: 11px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 52px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_30 {
  width: 34px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Semi Bold;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_31 {
  width: 84px;
  height: 13px;
  background: url("../images/v1_31.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 45px;
  left: 0px;
  overflow: hidden;
}
.v1_32 {
  width: 32px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 52px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_33 {
  width: 32px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 0px;
  left: 0px;
  font-family: Inter;
  font-weight: Semi Bold;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_34 {
  width: 60px;
  height: 15px;
  background: url("../images/v1_34.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  overflow: hidden;
}
.v1_35 {
  width: 60px;
  height: 15px;
  background: rgba(55,66,83,1);
  opacity: 1;
  position: relative;
  top: 0px;
  left: 0px;
  border: 0.752173900604248px solid rgba(244,247,251,1);
  overflow: hidden;
}
.v1_36 {
  width: 50px;
  color: rgba(255,255,255,1);
  position: absolute;
  top: 1px;
  left: 5px;
  font-family: Inter;
  font-weight: Semi Bold;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.v1_37 {
  width: 82px;
  height: 16px;
  background: url("../images/v1_37.png");
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  opacity: 1;
  position: absolute;
  top: 152px;
  left: 96px;
  overflow: hidden;
}
.v1_38 {
  width: 82px;
  color: rgba(25,38,56,1);
  position: absolute;
  top: 3px;
  left: 0px;
  font-family: Inter;
  font-weight: Regular;
  font-size: 9px;
  opacity: 1;
  text-align: left;
}
.name {
  color: #fff;
}
</style>
""";
    final List<Directory>? dir = await getExternalStorageDirectories();
    if (dir != null) {
      Directory tempDir = dir[0].parent.parent.parent.parent;
      Directory docDir = Directory("${tempDir.path}/Documents");
      docDir.create(); //* creates the Documents folder if it does not exist.
      File generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
          htmlContent, docDir.path, "Invoice");
      OpenFile.open(generatedPdfFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () {
                  _admitCard1(
                      examName: "First Term Exam", studentName: "Ram Adhikari");
                },
                child: Text('Generate admit card 1'))));
  }
}
