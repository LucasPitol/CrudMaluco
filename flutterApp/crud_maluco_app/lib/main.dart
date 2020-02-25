import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/filter_component.dart';
import 'package:crud_maluco_app/listagem_component.dart';
import 'package:flutter/material.dart';

import 'models/client_item.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _CDState createState() => _CDState();
  // State<StatefulWidget> createState() {
  //   return _CDState();
  // }
}

class _CDState extends State<MyApp> {
  final dbReference = Firestore.instance;

  FloatingActionButtonLocation _addFabLocation =
      FloatingActionButtonLocation.endDocked;

  List<ClientItem> clientItemList = new  List<ClientItem>();

  var loading = true;

  void getClients() {
    print('obj');
    setState(() {
      this.loading = true;
      this.clientItemList = [];
    });

    dbReference
        .collection('client')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((item) {
        var obj = item.data;
        print(obj);
        var client = ClientItem.build(name: obj['name'], email: obj['email']);

        clientItemList.add(client);
      });
      setState(() {
        this.loading = false;
      });
    }).catchError((onError) {
      print(onError);
      setState(() {
        this.loading = false;
      });
    });
  }
 

  void _showFilterModal() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return FilterComponent();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Crud Maluco',
            style: TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        // AppBar }
        body: Center(
          child: ListagemComponent(this.loading, this.clientItemList),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: this.getClients,
        ),
        floatingActionButtonLocation: this._addFabLocation,
        bottomNavigationBar: this._buildBottomAppBar(context),
      ),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Colors.deepPurple,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: this._showFilterModal,
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.delete,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
    );
  }
}
