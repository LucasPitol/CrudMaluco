import 'package:animations/animations.dart';
import 'package:cd_app/models/person.dart';
import 'package:cd_app/pages/edit_person/edit_person_component.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

class PersonTileWidget extends StatelessWidget {
  final Person person;
  final VoidCallback updatePageContent;
  final VoidCallback switchRefresh;

  PersonTileWidget(
      {required this.person,
      required this.updatePageContent,
      required this.switchRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // decoration: Styles.cardDecoration,
      child: OpenContainer(
        closedElevation: 2,
        closedShape:
            RoundedRectangleBorder(borderRadius: Styles.defaultBorderRadius),
        onClosed: (val) {
          this.updatePageContent();
        },
        closedBuilder: (context, action) {
          return Container(
            child: ListTile(
              title: Text(
                person.name,
                style: Styles.montText,
              ),
              subtitle: Text(
                person.country,
                style: Styles.montTextLight,
              ),
            ),
          );
        },
        openBuilder: (contex, action) {
          return EditPersonComponent(
            person: person,
            switchRefresh: switchRefresh,
          );
        },
      ),
    );
  }
}
