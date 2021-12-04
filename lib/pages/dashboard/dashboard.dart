import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/avaliation_360.dart';
import 'package:omni_manager/pages/dashboard/widgets/bar_chart_section.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
import 'package:omni_manager/pages/dashboard/widgets/overview_cards_large.dart';
import 'package:omni_manager/pages/dashboard/widgets/projects.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextTitle(
              text: "Dashboard",
              size: 40,
              weight: FontWeight.bold,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: OverviewCardsLargeScreen(performance: 0.123, completion: 0.999, quality: 0.65,)),
                  SizedBox(width: 50),
                  Center(child: RevenueSectionLarge()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
