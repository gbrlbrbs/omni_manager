import 'package:flutter/material.dart';
import 'package:omni_manager/constants/style.dart';
import 'package:omni_manager/pages/dashboard/widgets/bar_chart.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_content.dart';
import 'package:omni_manager/pages/dashboard/widgets/pie_chart.dart';

class RevenueSectionLarge extends StatelessWidget {
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
                  text: "Desempenho por funcionário",
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
                    child: SimpleBarChart.withUnformattedData({"A": 10, "B": 25.7, "C": 47.88})),
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
                    child: PieOutsideLabelChart.withUnformattedData({"A": 10, "B": 25.7, "C": 47.88})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
