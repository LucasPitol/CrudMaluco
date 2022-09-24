import 'package:cd_app/pages/person_locale_graph/controllers/person_locale_graph_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/pages/shared/loading_container.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/pie_chart_component.dart';

class PersonLocaleComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonLocaleGrapthController>(
      init: PersonLocaleGrapthController(),
      builder: (controller) {
        return controller.loading
            ? LoadingContainer(controller.loading)
            : Container(
                child: Stack(
                  children: [
                    Container(
                      child: PieChartComponent(
                          personLocaleMap: controller.personLocaleMap),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        borderRadius: Styles.circularBorderRadius,
                        onTap: () {
                          controller.getGraphData();
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
                  ],
                ),
              );
      },
    );
  }
}
