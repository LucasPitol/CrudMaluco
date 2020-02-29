import 'package:flutter/material.dart';

import 'default_app_bar.dart';


class RegionalComponent extends MaterialPageRoute<String> {
  RegionalComponent()
      : super(builder: (BuildContext context) {

        return Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: DefaultAppBar(context),
          body: Column(
            children: <Widget>[
              Text('data')
            ],
          ),
        );

      }
}