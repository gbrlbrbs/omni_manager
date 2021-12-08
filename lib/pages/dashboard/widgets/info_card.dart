import 'package:flutter/material.dart';
import 'package:omni_manager/constants/style.dart';

class InfoCard extends StatelessWidget {
  final String? title;
  final String? value;
  final String? mean;
  final Color? topColor;
  final void Function()? onTap;

  const InfoCard(
      {Key? key, this.title, this.value, this.onTap, this.topColor, this.mean})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: normalYellow,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: lightYellow.withOpacity(.3),
                blurRadius: 12)
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "$title\n\n",
                      style: TextStyle(fontSize: 16, color: dark, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "$value",
                      style: TextStyle(fontSize: 32, color: dark)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
