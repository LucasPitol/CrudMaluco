import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AlertDialogComponent extends StatefulWidget {
  final String title;
  final String content;

  AlertDialogComponent(this.title, this.content);

  @override
  _AlertDialogComponentState createState() =>
      _AlertDialogComponentState(title, content);
}

class _AlertDialogComponentState extends State<AlertDialogComponent> {
  final String title;
  final String content;

  _AlertDialogComponentState(this.title, this.content);

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) => this._showDialog());
  }

  _showDialog() {
    return showGeneralDialog(
        barrierColor: Colors.white.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(16.0)),
                title: Text(
                  this.title,
                  style: TextStyle(
                    color: Styles.mainTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  this.content,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: closeDialog,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Styles.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return const AlertDialog(
            title: Text('data'),
          );
        });
  }

  closeDialog() {
    Navigator.pop(context, 'Ok');
    Navigator.pop(context, 'Ok');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
