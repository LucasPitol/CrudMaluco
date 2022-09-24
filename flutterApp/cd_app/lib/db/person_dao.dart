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
        var person = Person(item);

        personList.add(person);
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

  Future<bool> deletePerson(String personId) async {
    bool success = false;

    await dbReference
        .collection(personsCollectionName)
        .doc(personId)
        .delete()
        .then((value) {
      success = true;
      return success;
    }).catchError((onError) {
      print(onError);
      return success;
    });
    return success;
  }

  Future<bool> createNewPerson(String personName, String country) async {
    bool success = false;
    Timestamp creationDate = Timestamp.fromDate(DateTime.now());

    var batch = dbReference.batch();

    var docRef = dbReference.collection(personsCollectionName).doc();

    String id = docRef.id;

    batch.set(docRef, {
      'id': id,
      'name': personName,
      'country': country,
      'creationDate': creationDate,
    });

    await batch.commit().then((value) {
      success = true;
      return success;
    }).catchError((onError) {
      print(onError);
      return success;
    });
    return success;
  }
}
