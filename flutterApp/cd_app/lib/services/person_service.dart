import 'package:cd_app/db/person_dao.dart';
import 'package:cd_app/models/forms/new_person_form.dart';
import 'package:cd_app/models/person.dart';

class PersonService {
  PersonDao _personDao;

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
}
