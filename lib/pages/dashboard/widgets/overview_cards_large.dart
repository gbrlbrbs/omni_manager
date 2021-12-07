import 'package:flutter/material.dart';
import 'package:omni_manager/constants/style.dart';
import 'package:omni_manager/pages/dashboard/widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
  final double performance;
  final double quality;
  final double completion;
  OverviewCardsLargeScreen(
      {this.performance: 0, this.completion: 0, this.quality: 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InfoCard(
                title: "Desempenho",
                value: (performance * 100).toStringAsFixed(1) + "%",
                onTap: () {},
                topColor: dark),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InfoCard(
                title: "Tarefas feitas",
                value: (completion * 100).toStringAsFixed(1) + "%",
                topColor: dark,
                onTap: () {}),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InfoCard(
                title: "Qualidade",
                value: (quality * 100).toStringAsFixed(1) + "%",
                topColor: dark,
                onTap: () {}),
          ),
        ],
      ),
    );
  }
}
