import 'package:cd_app/pages/edit_person/edit_person_component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/services/person_service.dart';
import 'package:animations/animations.dart';
import 'package:cd_app/models/person.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

class PersonListComponent extends StatefulWidget {
  PersonListComponent({Key key}) : super(key: key);

  @override
  PersonListComponentState createState() => PersonListComponentState();
}

class PersonListComponentState extends State<PersonListComponent> {
  List<Person> personList;
  PersonService _personService;

  bool loading = true;
  bool refresh = false;

  PersonListComponentState() {
    this.personList = [];
    this._personService = PersonService();
  }

  @override
  void initState() {
    super.initState();
    this.updatePageContent();
  }

  updatePageContent() async {
    setState(() {
      this.loading = true;
    });

    this.personList = await _personService.getPersons();

    setState(() {
      this.loading = false;
    });
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
          if (refresh) {
            this.updatePageContent();
            this.refresh = false;
          }
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
          return EditPersonComponent(
            person: item,
            switchRefresh: switchRefresh,
          );
        },
      ),
    );
  }

  switchRefresh() {
    this.refresh = true;
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            alignment: Alignment.center,
            child: Theme(
              data: Theme.of(context).copyWith(
                accentColor: Styles.primaryColor,
              ),
              child: new CircularProgressIndicator(),
            ),
          )
        : Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(10),
                  child: InkWell(
                    borderRadius: Styles.circularBorderRadius,
                    onTap: () {
                      this.updatePageContent();
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
                personList.isNotEmpty
                    ? Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: personList
                                .map((item) => createTile(item))
                                .toList(),
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                        child: Text(
                          'no person to show, tap the add button to create one.',
                          style: Styles.montTextLight,
                          textAlign: TextAlign.center,
                        ),
                      ),
              ],
            ),
          );
  }
}
