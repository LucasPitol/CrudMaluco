import 'package:cd_app/models/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonDao {
  final dbReference = FirebaseFirestore.instance;
  final String personsCollectionName = 'persons';

  Future<List<Person>> getPersons() async {
    List<Person> personList = [];

    await dbReference
        .collection(personsCollectionName)
        .orderBy('name')
        .get()
        .then((snapShot) {
      snapShot.docs.forEach((item) {
        var spend = Person(item);

        personList.add(spend);
      });
    });

    return personList;
  }
}
