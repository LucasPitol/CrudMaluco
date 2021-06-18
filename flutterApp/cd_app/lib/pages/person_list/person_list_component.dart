import 'package:animations/animations.dart';
import 'package:cd_app/models/person.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersonListComponent extends StatefulWidget {
  @override
  _PersonListComponentState createState() => _PersonListComponentState();
}

class _PersonListComponentState extends State<PersonListComponent> {
  List<Person> personList;

  _PersonListComponentState() {
    this.personList = [];
  }

  @override
  void initState() {
    super.initState();
    this.getPersonList();
  }

  getPersonList() {
    this.personList = [];

    var p1 = Person();
    p1.id = 'ABC124';
    p1.name = 'Judas Neto';
    p1.country = 'Brazil';

    var p2 = Person();
    p2.id = 'ABC1245';
    p2.name = 'Cleiton Douglas';
    p2.country = 'Netherlands';

    personList.add(p1);
    personList.add(p2);
  }

  Widget createTile(Person item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // decoration: Styles.cardDecoration,
      child: OpenContainer(
        closedElevation: 2,
        closedShape:
            RoundedRectangleBorder(borderRadius: Styles.defaultBorderRadius),
        onClosed: (val) {
          print('closed');
        },
        closedBuilder: (context, action) {
          return Container(
            child: ListTile(
              title: Text(
                item.name,
                style: Styles.montText,
              ),
              subtitle: Text(
                item.country,
                style: Styles.montTextLight,
              ),
            ),
          );
        },
        openBuilder: (contex, action) {
          return Container();
        },
      ),
    );
  }

  _refresh() {
    print('Refresh');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(10),
            child: InkWell(
              borderRadius: Styles.circularBorderRadius,
              onTap: () {
                this._refresh();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: FaIcon(
                  FontAwesomeIcons.redo,
                  size: 20,
                  color: Styles.mainTextColor,
                ),
              ),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: personList.map((item) => createTile(item)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
