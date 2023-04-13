import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<void> invoice({
  required String pan_no,
  required String address,
  required String postal_code,
  required String tel_no,
  required String company_email,
  required String website,
  required String company_logo,
  required String company_name,
  required String invoice_Id,
  required String studentClass,
  required String studentSection,
  required String studentId,
  required String studentName,
  required String generatedBy,
  required String totalFee,
  required List<Map<String, String>> feeDetails,
  required String prev_due,
  required String grand_total,
}) async {
  var format1 = """
<!DOCTYPE html>
<html>
  <head>
    
  </head>
  <body>
    <div style="margin-top: 1.5rem; margin-bottom: 1.5rem">
  <div
    style="
      border: 1px solid black;
      border-radius: 0.25rem;
      box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
      min-width: 100%;
      overflow-x: auto;
    "
  >
    <div style="display: inline-block; width: 100%; vertical-align: middle">
      <div style="width: 100%; border-radius: 0.5rem">
        <table
          style="
          
            display: table;
            width: 100%;
            min-width: 100%;
            border-collapse: separate;
            border-spacing: 0px;
            border-color: black;
            border-style: solid;
            border-width: 0px;
            border-bottom-width: 1px;
          "
        >
          <thead style="background-color: #f1f5f9">
            <tr style="height: 60px">
              <th
                scope="col"
                style="
                  
                  padding-right: 3rem;
                  width: 400px;
                  text-align: left;
                  font-size: small;
                  font-weight: 600;
                  color: #374151;
                  border-bottom: 1px solid black;
                  border-right: 1px solid black;
                "
              >
                <div style="display: flex; gap: 1.25rem">
                  <span>
                    <img
                      src= $company_logo
                      alt="logo"
                      style="border-radius: 50%; width: 80px; height: 80px"
                    />
                  </span>
                  <span style="margin-top: 0.75rem">$company_name</span>
                </div>
              </th>
              <th
                scope="col"
                style="
                  
                  text-align: left;

                  font-size: small;
                  font-weight: 500;
                  color: #374151;
                  border-bottom: 1px solid black;
                "
              >
                <div>
                <div style="display: flex; justify-content: space-between">
                  <span style="padding: 1rem">Fee Invoice</span>
                  </div>
                  <hr style="border: 1px solid black; margin-top: 3px" />
                  <div style="display: flex; justify-content: space-between">
                    <span style="padding: 1rem">
                     Month Fee
                    </span>
                    <span style="padding: 1rem">Amount(Rs.)</span>
                  </div>
                </div>
              </th>
            </tr>
          </thead>

          <tbody
            style="background-color: #f1f5f9; border-bottom: 0px solid #e2e8f0"
          >
            <tr style="flex-direction: row;">
              <td
                 style="   
                          
                  white-space: nowrap;
                           
                  font-size: small;
                  border-right: 2px solid black;
                  color: #000000;
                  

                   background-color: #f1f5f9;
                "
              >
              <div
                  style="  
                  
                    padding-left: 0.75rem;
                    padding-right: 0.75rem;      
                   padding-bottom: 1.5rem;
                   
                  "
                >
                  <div
                    style="display: flex; flex-direction: column; gap: 1.25rem;"
                  >
                    <div style="text-align: left;">
                      <p
                        style="
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        #Invoice: $invoice_Id
                      </p>
                      <p
                        style="
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        Bill to:
                      </p>
                      <p style="color: #374151">ID: $studentId</p>
                      <p style="color: #374151">Name: $studentName</p>
                      <p style="color: #374151">
                        Class: $studentClass
                      </p>
                      <p style="color: #374151">
                        Section: $studentSection
                      </p>
                    </div>
                    <div style="text-align: right">
                      <p
                        style="
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        Pan no: $pan_no
                      </p>
                      <p style="color: #374151">$address</p>
                      <p
                        style="
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        P.O.Box: $postal_code
                      </p>
                      <p style="color: #374151">Tel:$tel_no</p>
                      <p style="color: #374151">Email: $company_email</p>
                      <p
                        style="
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        $website
                      </p>
                    </div>
                  </div>
                </div>
                <div style="
                  position:relative;
                  height:70px;  
                  ">
                  <div class="e1_4" style="background-color:#334155;
	                width:100%;
	                  height:70px;
	                  position:absolute;
	                     left:0px;
	                     top:1px;                     
                       "></div>
                       <div class="e1_5" style="background-color:#f1f5f9;
	                     width:100%;
	                     height:70px;
	                     position:absolute;
                       
	                     left: 0px;
	                     top:0px;
	                     border-radius:0 0 0 150px;
  
                       "></div>
                       
                     </div>
              </td>
              <td
                style="                
                  white-space: nowrap;
                  padding-top: 4px;
                  padding-bottom: 4px;                
                  font-size: small;
                  color: #000000;
                  background-color: #f1f5f9;
                "
              >
              <div style="flex:1;display: flex; flex-direction: column; gap: 10px;">
              ${feeDetails.map<String>((e) => '<div style="display: flex; justify-content: space-between; align-items: flex-start; margin-top: 3px; color: #000000; vertical-align: top;"><span style="padding-left: 1rem; padding-right: 1rem;">${e["description"]}</span><span style="padding-left: 1rem; padding-right: 1rem;">${e["total"]}</span></div>').join('')}
              <hr
                      style="  
                        width:400px;         
                        border-style: solid;
                        border-color: black;
                        margin-top: 1.5rem;
                      "
                    />
              </div>
              
               <div style="flex:1;display: flex; flex-direction: column; gap: 10px;">
              
                    <div style="display: flex; justify-content: space-between">
                      <span
                        style="
                          padding-left: 1rem;
                          padding-right: 1rem;
                          font-size: small;
                          font-weight: 600;
                          color: #374151;
                        "
                      >
                        Generated by: $generatedBy
                      </span>
                      <div style="padding-left: 1rem; padding-right: 1rem">
                        <p
                          style="
                            font-size: 0.875rem;
                            text-align: right;
                            font-weight: 500;
                            color: #4b5563;
                            margin-top: 1px;
                            margin-bottom: 1px;
                          "
                        >
                          Total: $totalFee
                        </p>
                        <p
                          style="
                            font-size: 0.875rem;
                            text-align: right;
                            font-weight: 500;
                            color: #4b5563;
                            margin-top: 1px;
                            margin-bottom: 1px;
                          "
                        >
                          Previous Due: $prev_due
                        </p>
                        <p
                          style="
                            font-size: 0.875rem;
                            text-align: right;
                            font-weight: 500;
                            color: #4b5563;
                            margin-top: 1px;
                            margin-bottom: 1px;
                          "
                        >
                          Grand Total: $grand_total
                        </p>
                      </div>
                    </div>
              </div>
              </td>
            </tr>
          </tbody>
        </table>
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
      format1, docDir.path, "Invoice");
  OpenFile.open(generatedPdfFile.path);
}
