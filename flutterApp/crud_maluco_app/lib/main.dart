import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/filter_component.dart';
import 'package:crud_maluco_app/listagem_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_client_component.dart';
import 'info_dialog_component.dart';
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

  List<ClientItem> clientItemList = new List<ClientItem>();

  var loading = true;

  @override
  void initState() {
    super.initState();
    this.getClients();
  }

  void getClients() {
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

  void _openInfoDialog() {
    showDialog<String>(
      context: context,
      builder: (builder) {
        return InfoDialogComponent('Info', 'Massa');
      }
    );
  }

  void _goToAddClientComponent() {
    Navigator.push(context, AddClientComponent());
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
          onPressed: _goToAddClientComponent,
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
            onPressed: this.getClients,
          ),
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            onPressed: _openInfoDialog,
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
