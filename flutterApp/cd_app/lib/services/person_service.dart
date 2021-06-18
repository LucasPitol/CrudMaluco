import 'package:cd_app/db/transactions_dao.dart';
import 'package:cd_app/models/person.dart';

class PersonService {
  PersonDao personDao;

  PersonService() {
    this.personDao = PersonDao();
  }

  Future<List<Person>> getPersons() async {
    List<Person> personList = await this.personDao.getPersons();

    return personList;
  }
}