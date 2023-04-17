import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf_generator/routine.dart';

Future<void> routine(
    {required String studentName,
    required String schoolName,
    required String schoolAddress,
    required String schoolPhone,
    required String studentId,
    required String examName,
    required String examStartDate,
    required String examStartTime,
    required String examEndTime,
    required String studentDob,
    required String studentClass,
    required String studentSection,
    required String studentRoll,
    required String studentPhone,
    required String cardValidity,
    required String studentPhoto,
    required String schoolLogo,
    required List<RoutineModel> routine,
    required String barCode,
    required String signature}) async {
  var format1 = """
<!DOCTYPE html>
<html>
  <head>
    
  </head>
  <body>

    <div style="margin: 1.25rem;">
  <div
    style="border-style: solid; border-width: 4px; border-color: black; padding: 0.25rem; margin: 1.25rem 0; min-height: 1000px;"
  >
    <div style="display: flex; padding: 1.25rem;">
      <span>
        <img
          src=$schoolLogo
          alt="logo"
          style="height: 77px; margin-top: 0.75rem;"
        />
      </span>
      <div style="margin-left: 4rem; margin-right: auto; padding-left: 0; padding-right: 1.25rem; padding-top: 0.5rem; padding-bottom: 0.125rem; color: #4b5563;">
        <p style="font-weight: 700; margin-bottom: 0.5rem; font-size: 2rem;">$schoolName</p>
        <p style="margin-bottom: 0.5rem; text-align: center;">$schoolAddress</p>
        <p style="margin-bottom: 0.5rem; text-align: center;">Tel : $schoolPhone</p>
        <p style="font-weight: 700; margin-bottom: 0.5rem; text-align: center;">Exam Routine</p>
      </div>
    </div>
    <div style="color: #4b5563; padding-left: 1.25rem; padding-right: 1.25rem;">
      <p style="margin-bottom: 0.5rem;">
        It is hereby notified to all concerned that the&nbsp;
        <span style="border-bottom:2px dotted black; width: 50%; font-weight: 700; font-style: italic; padding-left: 1.25rem; padding-right: 1.25rem; margin-left: 0.75rem;">
          ${examName.toUpperCase()} EXAMINATION
        </span>
      </p>

      <p style="margin-bottom: 0.5rem;">
        of&nbsp;
        <span style="border-bottom:2px dotted black; width: 50%; font-weight: 700; font-style: italic; padding-left: 0.75rem; padding-right: 0.75rem; margin-left: 0.75rem;">
          Class $studentClass
        </span>
        &nbsp;will be held as per the schedule given below.
      </p>
    </div>
    <div style="display: flex; justify-content: space-between; padding-left: 1.25rem; padding-right: 1.25rem; color: #6b7280;">
      <p style="margin-bottom: 0.5rem;">
        <span style="font-weight: 700; font-style: italic;">Exam start date: </span>
        $examStartDate
      </p>
      <p style="margin-bottom: 0.5rem;">
        <span style="font-weight: 700; font-style: italic;">Exam time: </span>
        $examStartTime to $examEndTime
      </p>
    </div>
      <div style="border-radius: 0.5rem; padding-top: 0.875rem; padding-bottom: 0.875rem; padding-left: 0.8rem; padding-right: 0.8rem; ">
        <table border="1" style="min-width: 100%; border-collapse: collapse; border-spacing: 0px; min-height: 400px;">
          <thead style="">
            <tr>
              <th style=" padding-top: 0.875rem; padding-bottom: 0.875rem; padding-left: 0.75rem; padding-right: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 500; color: #4b5563;">
                SUBJECT/ CODE
              </th>
              <th style="padding-top: 0.875rem; padding-bottom: 0.875rem; padding-left: 0.75rem; padding-right: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 500; color: #4b5563;">
                Date
              </th>
              <th style="padding-top: 0.875rem; padding-bottom: 0.875rem; padding-left: 0.75rem; padding-right: 0.75rem; text-align: left; font-size: 0.875rem; font-weight: 500; color: #4b5563;">
                Day
              </th>
            </tr>
         </thead>      
          ${routine.map<String>((e) => '''
            <tr>
           <td style="white-space: nowrap; overflow: hidden; vertical-align: center; padding-top: 0.875rem;  padding-left: 0.75rem; padding-right: 0.75rem; font-size: 0.875rem; ">
           ${e.subjectName} ${e.subjectType == 1 ? '(TH)' : '(PR)'}
           </td>
           <td style="white-space: nowrap; overflow: hidden; vertical-align: center; padding-top: 0.875rem;  padding-left: 0.75rem; padding-right: 0.75rem; font-size: 0.875rem; ">
           ${e.examDate}
           </td>
           <td style="white-space: nowrap; overflow: hidden; vertical-align: center; padding-top: 0.875rem; padding-left: 0.75rem; padding-right: 0.75rem; font-size: 0.875rem; ">
           ${e.examDay}
           </td>
           </tr>
           ''').join('')}     
         </table>
          </div>
               
            <div style="padding-left: 10px; color: #4b5563; margin-bottom: 10px;">
  <p style="margin-top: 2px;">
    <span style="font-weight: bold; font-style: italic;">NOTE: </span>
  </p>
  <ul style="list-style-type: disc; padding-left: 15px;">
    <li>
      <p style="margin-top: 2px;">
        All registered schools should adhere to the timing given in the routine. Students must report to school latest by $examStartTime .
      </p>
    </li>
    <li>
      <p style="margin-top: 2px;">
        No student shall be allowed thereafter Please pay all the due before $examStartDate and collect your admit card for the exam.
      </p>
    </li>
  </ul>
</div>
          </div>
        </div>
  </body>
</html>
""";

  final Directory docDir = await getTemporaryDirectory();

  docDir.create(); //* creates the Documents folder if it does not exist.
  File generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
      format1, docDir.path, "Routine");
  OpenFile.open(generatedPdfFile.path);
}
