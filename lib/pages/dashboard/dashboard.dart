import 'package:flutter/material.dart';
import 'package:omni_manager/pages/dashboard/widgets/bar_chart_section.dart';
//import 'package:omni_manager/pages/dashboard/widgets/custom_text_content.dart';
import 'package:omni_manager/pages/dashboard/widgets/custom_text_title.dart';
import 'package:omni_manager/pages/dashboard/widgets/overview_cards_large.dart';
import 'package:omni_manager/pages/dashboard/widgets/projects.dart';
//import 'package:get/get_state_manager/get_state_manager.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 15),
            child: CustomTextTitle(
              text: "Dashboard",
              size: 24,
              weight: FontWeight.bold,
            )),
        Container(
          child: Row(
            children: [
              Center(child: OverviewCardsLargeScreen()),
              Center(child: RevenueSectionLarge()),
              Center(child: DataTable2SimpleDemo()),
            ],
          ),
        ),
      ],
    );
  }
}
