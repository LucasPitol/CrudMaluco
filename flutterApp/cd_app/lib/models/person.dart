import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  late String id;
  late String name;
  late String country;
  late DateTime creationDate;

  Person(DocumentSnapshot doc) {
    Map<String, dynamic> objMapp = doc.data() as Map<String, dynamic>;

    Timestamp creationDateTimestamp = objMapp['creationDate'];

    this.id = doc.id;
    this.name = objMapp['name'];
    this.country = objMapp['country'];
    this.creationDate = creationDateTimestamp.toDate();
  }
}
