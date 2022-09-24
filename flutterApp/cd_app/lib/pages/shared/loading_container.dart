import 'dart:ui';

import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final bool loading;

  LoadingContainer(this.loading);

  @override
  Widget build(BuildContext context) {
    return this.loading
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            alignment: Alignment.center,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSwatch()
                    .copyWith(secondary: Styles.primaryColor),
              ),
              child: new CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
