import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/filter_component.dart';
import 'package:crud_maluco_app/listagem_component.dart';
import 'package:crud_maluco_app/regional_component.dart';
import 'package:crud_maluco_app/services/client_service.dart';
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

  final ClientService clientService = new ClientService();

  FloatingActionButtonLocation _addFabLocation =
      FloatingActionButtonLocation.endDocked;

  List<ClientItem> clientItemList = new List<ClientItem>();
  Map<String, double> regionalMap = new Map<String, double>();

  var loading = true;
  var pieChartLoading = true;

  @override
  void initState() {
    super.initState();
    this.updateData();
  }

  Future<void> getPieChartData() async {
    setState(() {
      this.pieChartLoading = true;
    });

    this.regionalMap.clear();

    this.regionalMap = await this.clientService.getGraphData();

    setState(() {
      this.pieChartLoading = false;
    });
  }

  void updateData() {
    this.getClients();
    this.getPieChartData();
  }

  Future<void> getClients() async {
    setState(() {
      this.loading = true;
      this.clientItemList = [];
    });

    this.clientItemList = await this.clientService.getClientList();

    setState(() {
      this.loading = false;
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
        });
  }

  void _goToAddClientComponent() {
    Navigator.push(context, AddClientComponent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Crud Maluco',
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              indicatorColor: Colors.deepPurple,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                )),
                Tab(icon: Icon(Icons.place, color: Colors.grey)),
              ],
            ),
          ),
          // AppBar }
          body: TabBarView(
            children: [
              Center(
                child: ListagemComponent(this.loading, this.clientItemList),
              ),
              Center(
                child:
                    RegionalComponent(this.pieChartLoading, this.regionalMap),
              ),
            ],
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
            onPressed: this.updateData,
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
