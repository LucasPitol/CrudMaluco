import 'package:crud_maluco_app/models/client_item.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class ListagemComponent extends StatelessWidget {
  final bool loading;

  final List<ClientItem> items;

  ListagemComponent(this.loading, this.items);

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: Colors.deepPurple),
          child: new CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        child: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(item.name),
                  subtitle: Text(item.email),
                ),
              ],
            );
          },
          separatorBuilder: (_, context) => Divider(),
          addAutomaticKeepAlives: false,
        ),
      );
    }
  }
}
