import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/bar_chart_section.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
import 'package:omni_manager/pages/dashboard/widgets/overview_cards_large.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 30.0),
              child: CustomTextTitle(
                text: "Dashboard",
                size: 40,
                weight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: OverviewCardsLargeScreen()),
                  SizedBox(width: 50),
                  Center(child: BarChartDash(isManager: true)),
                  SizedBox(width: 50),
                  Center(child: BarChartDash(isManager: false))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
