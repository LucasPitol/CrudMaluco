import 'package:crud_maluco_app/models/client_item.dart';
import 'package:flutter/material.dart';

class ListagemComponent extends StatelessWidget {
  List<ClientItem> items = <ClientItem>[
    new ClientItem.build(name: 'Rivaldin', email: 'sasarica@gmail.com'),
    new ClientItem.build(name: 'Amora Regina', email: 'morinha@gmail.com'),
    new ClientItem.build(
        name: 'Sanderson farias', email: 'fardolencio@gmail.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.builder(
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
              Divider(),
            ],
          );
        },
      ),
      // child: ListView(
      //   children: <Widget>[
      //     ...(items as List<ClientItem>).map((dto) {
      //       return Card(
      //         child: ListTile(
      //           leading: Icon(Icons.account_circle),
      //           title: Text(dto.name),
      //           subtitle: Text(dto.email),
      //         ),
      //       );
      //     })
      //   ],
      // ),
    );
  }
}
