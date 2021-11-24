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
              Row(
                children: [
                  Center(child: OverviewCardsLargeScreen()),
                  Center(child: RevenueSectionLarge()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Center(child: ProjectsTableSimple()),
                    Center(child: Avaliation360TableSimple()),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
