import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericAppBar extends StatelessWidget {
  final String title;

  GenericAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            this.title,
            style: Styles.montTextTitle,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              Get.close(0);
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: FaIcon(
                FontAwesomeIcons.x,
                size: 22,
                color: Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
