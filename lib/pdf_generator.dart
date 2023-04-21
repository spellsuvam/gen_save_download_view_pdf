import 'package:flutter/material.dart';
import 'package:pdf_generator/invoice_format.dart';
import 'package:pdf_generator/receipt_format.dart';
import 'package:pdf_generator/routine.dart';
import 'package:pdf_generator/routine_format.dart';

import 'admit_card_format.dart';
import 'id_card_format.dart';

class PdfGenerator extends StatefulWidget {
  const PdfGenerator({super.key});

  @override
  State<PdfGenerator> createState() => PdfGeneratorState();
}

class PdfGeneratorState extends State<PdfGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () {
              idCard(
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
            child: const Text('Generate Id card 1')),
        TextButton(
            onPressed: () {
              admitCard(
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
                studentId: "163/075",
                studentPhoto:
                    "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                studentRoll: "1",
                studentSection: "A",
                signature:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Jon_Kirsch%27s_Signature.png/800px-Jon_Kirsch%27s_Signature.png?20100224042226",
              );
            },
            child: const Text('Generate Admit Card 1')),
        TextButton(
            onPressed: () {
              routine(
                routine: [
                  RoutineModel(
                      subjectType: 1,
                      subjectName: "Math",
                      examDate: "2078/08/02",
                      examDay: "Tuesday"),
                  RoutineModel(
                      subjectType: 1,
                      subjectName: "Nepali",
                      examDate: "2078/08/02",
                      examDay: "Tuesday"),
                  RoutineModel(
                      subjectType: 1,
                      subjectName: "Science",
                      examDate: "2078/08/02",
                      examDay: "Tuesday"),
                  RoutineModel(
                      subjectType: 2,
                      subjectName: "Science",
                      examDate: "2078/08/02",
                      examDay: "Tuesday")
                ],
                examEndTime: "01:00 PM",
                examStartTime: "10:00 AM",
                examStartDate: "2080/03/27",
                examName: "first term",
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
            child: const Text('Generate Routine 1')),
        TextButton(
            onPressed: () {
              invoice(
                address: "Baneshwor",
                company_email: "Spell@gmail.com",
                company_name: "Spell sarathi school",
                generatedBy: "Ranjit Shrestha",
                grand_total: "10000",
                postal_code: "12546512",
                invoice_Id: "12546",
                pan_no: "156415",
                tel_no: "021-458795",
                totalFee: "4658",
                feeDetails: [
                  {"description": "magh fee", "total": "41554"},
                  {"description": "falgun fee", "total": "41554"},
                  {"description": "chaitra fee", "total": "41554"},
                  {"description": "magh fee", "total": "41554"},
                ],
                website: "www.ranjit.com",
                prev_due: "45551",
                company_logo:
                    "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                studentName: "Ram Adhikari",
                studentClass: "1",
                studentId: "163/075",
                studentSection: "A",
              );
            },
            child: const Text('Generate Invoice 1')),
        TextButton(
            onPressed: () {
              receipt(
                address: "Baneshwor",
                company_email: "Spell@gmail.com",
                company_name: "Spell sarathi school",
                sentBy: "Ranjit Shrestha",
                grand_total: "10000",
                postal_code: "12546512",
                receipt_Id: "12546",
                pan_no: "156415",
                tel_no: "021-458795",
                totalFee: "4658",
                feeDetails: [
                  {"description": "Payment Amount", "total": "41554"},
                  {"description": "Payment Amount", "total": "41554"},
                  {"description": "Payment Amount", "total": "41554"},
                  {"description": "Payment Amount", "total": "41554"},
                ],
                website: "www.ranjit.com",
                prev_due: "45551",
                company_logo:
                    "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
                studentName: "Ram Adhikari",
                studentClass: "1",
                studentId: "163/075",
                studentSection: "A",
              );
            },
            child: const Text('Generate Receipt 1')),
      ],
    )));
  }
}
