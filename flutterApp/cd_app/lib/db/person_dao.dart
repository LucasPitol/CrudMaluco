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

  Future<bool> updatePerson(
      String personId, String personName, String country) async {
    bool success = false;
    Timestamp lastUpdate = Timestamp.fromDate(DateTime.now());

    await dbReference.collection(personsCollectionName).doc(personId).set({
      'name': personName,
      'country': country,
      'lastUpdate': lastUpdate,
    }, SetOptions(merge: true)).then((value) {
      success = true;
      return success;
    }).catchError((onError) {
      print(onError);
      return success;
    });
    return success;
  }
}
