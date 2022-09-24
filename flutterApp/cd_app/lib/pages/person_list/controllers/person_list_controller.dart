import 'package:cd_app/services/person_service.dart';
import 'package:cd_app/models/person.dart';
import 'package:get/get.dart';

class PersonListController extends GetxController {
  late List<Person> personList = [];
  late PersonService _personService = PersonService();

  late bool loading = true;
  late bool refreshing = false;

  updatePageContent() async {
    this.loading = true;
    update();

    this.personList = await _personService.getPersons();

    this.loading = false;
    update();
  }

  switchRefresh() {
    this.refreshing = true;
  }

  @override
  void onInit() {
    super.onInit();
    this.updatePageContent();
  }

  @override
  void onReady() async {
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    update();
    super.dispose();
  }
}
