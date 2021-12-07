import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:omni_manager/constants/style.dart';
import 'package:omni_manager/api/firebase.dart';
import 'package:omni_manager/pages/dashboard/widgets/bar_chart.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_content.dart';
import 'package:omni_manager/pages/dashboard/widgets/pie_chart.dart';

class BarChartDash extends StatefulWidget {
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<BarChartDash> {
  final Future<QuerySnapshot> _employees = Database.listEmployees();

  late Map<String, double> _empData;

  void _getEmployeeData() async {
    Map<String, double> empData = {};
    _empData = await _employees.then((query) async {
      if (query.size != 0) {
        for (var emp in query.docs) {
          var empDoc = Database.getEmployeeData(emp);
          var empID = await empDoc.then((value) => value.id);
          var empName = await empDoc.then((value) {
            var data = value.data() as Map<String, dynamic>;
            return data["name"];
          });
          var empForms = Database.getEmployeeForms(empID);
          await empForms.then((snapshot) {
            if (snapshot.size != 0) {
              List<double> completions = [];
              snapshot.docs.forEach((form) {
                var data = form.data() as Map<String, dynamic>;
                var compl = data["work_completion"] as double;
                completions.add(compl);
              });
              var mean =
                  completions.reduce((value, element) => value + element) /
                      completions.length;
              empData.putIfAbsent(empName, () => mean);
            }
          });
        }
        return empData;
      } else
        return {};
    });
  }

  @override
  void initState() {
    super.initState();
    _getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextContent(
                  text: "Desempenho por funcionário - Últimos 7 dias",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: 400,
                    height: 250,
                    child: SimpleBarChart.withUnformattedData(
                        _empData)),
              ],
            ),
          ),
          Container(width: 350, height: 50, color: Colors.white),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTextContent(
                  text: "Carga de trabalho",
                  size: 20,
                  weight: FontWeight.bold,
                  color: dark,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 400,
                    height: 250,
                    child: PieOutsideLabelChart.withUnformattedData(
                        {"A": 10, "B": 25.7, "C": 47.88})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class BarChartDashStateless extends StatelessWidget {
//   Map<String, double> _getEmployeeData() {
//     Map<String, double> empData = {};
//     _employees.then((query) {
//       if (query.size != 0) {
//         query.docs.forEach((emp) async {
//           var empDoc = Database.getEmployeeData(emp);
//           var empID = await empDoc.then((value) => value.id);
//           var empName = await empDoc.then((value) {
//             var data = value.data() as Map<String, dynamic>;
//             return data["name"];
//           });
//           var empForms = Database.getEmployeeForms(empID);
//           empForms.then((snapshot) {
//             if (snapshot.size != 0) {
//               List<double> completions = [];
//               snapshot.docs.forEach((form) {
//                 var data = form.data() as Map<String, dynamic>;
//                 var compl = data["work_completion"] as double;
//                 completions.add(compl);
//               });
//               var mean =
//                   completions.reduce((value, element) => value + element) /
//                       completions.length;
//               empData[empName] = mean;
//             }
//           });
//         });
//       }
//     });
//     return empData;
//   }

//   final Future<QuerySnapshot> _employees = Database.listEmployees();

//   final Map<String, double> _empData = _getEmployeeData();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.4,
//       padding: EdgeInsets.all(24),
//       margin: EdgeInsets.symmetric(vertical: 30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//               offset: Offset(0, 6),
//               color: lightGrey.withOpacity(.1),
//               blurRadius: 12)
//         ],
//         border: Border.all(color: lightGrey, width: .5),
//       ),
//       child: Column(
//         children: [
//           Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomTextContent(
//                   text: "Desempenho por funcionário - Últimos 7 dias",
//                   size: 20,
//                   weight: FontWeight.bold,
//                   color: dark,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                     width: 400,
//                     height: 250,
//                     child: SimpleBarChart.withUnformattedData(
//                         {"A": 10, "B": 25.7, "C": 47.88})),
//               ],
//             ),
//           ),
//           Container(width: 350, height: 50, color: Colors.white),
//           Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 CustomTextContent(
//                   text: "Carga de trabalho",
//                   size: 20,
//                   weight: FontWeight.bold,
//                   color: dark,
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                     width: 400,
//                     height: 250,
//                     child: PieOutsideLabelChart.withUnformattedData(
//                         {"A": 10, "B": 25.7, "C": 47.88})),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
