import 'package:cd_app/db/person_dao.dart';
import 'package:cd_app/models/forms/new_person_form.dart';
import 'package:cd_app/models/person.dart';
import 'package:cd_app/utils/constants.dart';

class PersonService {
  late PersonDao _personDao;

  PersonService() {
    this._personDao = PersonDao();
  }

  Future<List<Person>> getPersons() async {
    List<Person> personList = await this._personDao.getPersons();

    return personList;
  }

  Future<bool> editPerson(String personId, NewPersonForm form) async {
    String personName = form.name.text;
    String country = form.country;

    var success =
        await this._personDao.updatePerson(personId, personName, country);

    return success;
  }

  Future<bool> deletePerson(String personId) async {
    var success = await this._personDao.deletePerson(personId);

    return success;
  }

  Future<bool> createNewPerson(NewPersonForm form) async {
    String personName = form.name.text;
    String country = form.country;

    var success = await this._personDao.createNewPerson(personName, country);

    return success;
  }

  Future<Map<String, double>> getPersonLocaleGraphData() async {
    Map<String, double> personLocaleMap = Map<String, double>();

    var personList = await this.getPersons();

    if (personList != null && personList.isNotEmpty) {
      List<String> countries = Constants.countries;

      for (String country in countries) {
        var personsFromCurrentCountry =
            personList.where((e) => e.country == country);

        if (personsFromCurrentCountry != null &&
            personsFromCurrentCountry.isNotEmpty) {
          double value = (personsFromCurrentCountry.length).toDouble();

          personLocaleMap.putIfAbsent(country, () => value);
        }
      }

      personLocaleMap = _sortLocaleMap(personLocaleMap);
    }

    return personLocaleMap;
  }

  Map<String, double> _sortLocaleMap(Map<String, double> personLocaleMapLocal) {
    Map<String, double> personLocaleMap = Map<String, double>();

    var sortedKeys = personLocaleMapLocal.keys.toList(growable: false)
      ..sort(
        (k1, k2) =>
            personLocaleMapLocal[k2]!.compareTo(personLocaleMapLocal[k1]!),
      );

    personLocaleMap = Map<String, double>.fromIterable(sortedKeys,
        key: (k) => k, value: (k) => personLocaleMapLocal[k]!);

    return personLocaleMap;
  }
}
