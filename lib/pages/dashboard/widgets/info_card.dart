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
        height: 158,
        width: 168,
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
        child: Row(
          children: [
            Container(
              color: topColor,
              height: 5,
            ),

            //Expanded(child: Container()),
            //Box context
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "$title\n",
                      style: TextStyle(fontSize: 20, color: dark)),
                  TextSpan(
                      text: "$value\n",
                      style: TextStyle(fontSize: 40, color: dark)),
                  TextSpan(
                      text: "Média da diretoria: $mean",
                      style: TextStyle(fontSize: 14, color: dark)),
                ]),
              ),
            ),
            //Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
