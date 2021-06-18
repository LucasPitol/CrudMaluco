import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  String id;
  String name;
  String country;
  DateTime creationDate;

  Person(DocumentSnapshot doc) {
    Map<String, dynamic> objMapp = doc.data();

    Timestamp creationDateTimestamp = objMapp['creationDate'];

    this.id = doc.id;
    this.name = objMapp['name'];
    this.country = objMapp['country'];
    this.creationDate = creationDateTimestamp.toDate();
  }
}
