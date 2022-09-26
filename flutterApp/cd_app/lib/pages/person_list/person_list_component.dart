import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/pages/shared/loading_container.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/person_list_controller.dart';
import 'components/person_tile_widget.dart';

class PersonListComponent extends StatelessWidget {
  // PersonListComponent({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext buildContext) {
    return GetBuilder<PersonListController>(
      init: PersonListController(),
      builder: (controller) {
        return controller.loading
            ? LoadingContainer(controller.loading)
            : Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        borderRadius: Styles.circularBorderRadius,
                        onTap: () {
                          controller.updatePageContent();
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: FaIcon(
                            FontAwesomeIcons.rotateRight,
                            size: 20,
                            color: Styles.mainTextColor,
                          ),
                        ),
                      ),
                    ),
                    controller.personList.isNotEmpty
                        ? Flexible(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.personList
                                    .map(
                                      (item) => PersonTileWidget(
                                        person: item,
                                        updatePageContent:
                                            controller.updatePageContent,
                                        switchRefresh: controller.switchRefresh,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 80),
                            child: Text(
                              'no person to show, tap the add button to create one.',
                              style: Styles.montTextLight,
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ],
                ),
              );
      },
    );
  }
}
