import 'package:cd_app/services/person_service.dart';
import 'package:get/get.dart';

class PersonLocaleGrapthController extends GetxController {
  late Map<String, double> personLocaleMap = Map<String, double>();
  late PersonService _personService = PersonService();

  late bool loading = true;

  getGraphData() async {
    this.loading = true;
    update();

    this.personLocaleMap = await this._personService.getPersonLocaleGraphData();

    this.loading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    this.getGraphData();
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
