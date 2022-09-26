import 'package:cd_app/pages/core/main_component.dart';
import 'package:cd_app/pages/new_person/new_person_component.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(
      name: AppRoutes.newPerson,
      page: () => NewPersonComponent(),
    ),

    GetPage(
      name: AppRoutes.main,
      page: () => MainComponent(),
    ),
  ];
}
