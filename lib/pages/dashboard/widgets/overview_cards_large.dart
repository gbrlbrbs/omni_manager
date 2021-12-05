import 'package:flutter/material.dart';
import 'package:omni_manager/constants/style.dart';
import 'package:omni_manager/pages/dashboard/widgets/info_card.dart';

class OverviewCardsLargeScreen extends StatelessWidget {
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
                value: "70%",
                onTap: () {},
                topColor: dark,
                mean: "90%"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InfoCard(
                title: "Presença",
                value: "80%",
                topColor: dark,
                onTap: () {},
                mean: "50%"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InfoCard(
                title: "Tarefas feitas",
                value: "30%",
                topColor: dark,
                onTap: () {},
                mean: "10%"),
          ),
        ],
      ),
    );
  }
}
