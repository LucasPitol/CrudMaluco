import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/filter_component.dart';
import 'package:crud_maluco_app/listagem_component.dart';
import 'package:crud_maluco_app/regional_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_client_component.dart';
import 'info_dialog_component.dart';
import 'models/client.dart';
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
  Map<String, double> regionalMap = new Map<String, double>();



  var loading = true;
  var pieChartLoading = true;

  @override
  void initState() {
    super.initState();
    this.updateData();
  }

  void getPieChartData() {
    setState(() {
      this.pieChartLoading = true;
    });

    this.regionalMap.clear();

    CityAndCount belemDoParaTemp = CityAndCount.build(city: 'Belem do Pará', countTemp: 0.0);
    CityAndCount pernambucoTemp = CityAndCount.build(city: 'Pernambuco', countTemp: 0.0);
    CityAndCount rioTemp = CityAndCount.build(city: 'Rio de Janeiro', countTemp: 0.0);
    CityAndCount saoPauloTemp = CityAndCount.build(city: 'São Paulo', countTemp: 0.0);

    dbReference
        .collection('client')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((item) {
        var obj = item.data;

        var client = Client.build(
          address: obj['address'],
          birthDate: obj['birthDate'],
          city: obj['cidade'],
          cpf: obj['cpf'],
          email: obj['email'],
          name: obj['name'],
        );

        var city = client.city;

        switch (city) {
          case 'Belem do Pará':
            belemDoParaTemp.countTemp = belemDoParaTemp.countTemp + 1;
            break;

          case 'Pernambuco':
            pernambucoTemp.countTemp = pernambucoTemp.countTemp + 1;
            break;

          case 'Rio de Janeiro':
            rioTemp.countTemp = rioTemp.countTemp + 1;
            break;

          case 'São Paulo':
            saoPauloTemp.countTemp = saoPauloTemp.countTemp + 1;
            break;

          default:
            break;
        }
      });

      List<CityAndCount> regionalList = [
        belemDoParaTemp,
        pernambucoTemp,
        rioTemp,
        saoPauloTemp,
      ];

      regionalList.sort((b, a) => a.countTemp.compareTo(b.countTemp));

      Map<String, double> regionalMapLocal = new Map<String, double>();

      regionalList.forEach((element) {
        regionalMapLocal.putIfAbsent(element.city, () => element.countTemp);
      });

      setState(() {
        this.pieChartLoading = false;
        this.regionalMap = regionalMapLocal;
      });
    }).catchError((onError) {
      print(onError);
      setState(() {
        this.pieChartLoading = false;
      });
    });
  }

  void updateData() {
    this.getClients();
    this.getPieChartData();
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
                child: RegionalComponent(this.pieChartLoading, this.regionalMap),
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

class CityAndCount {
  String city;
  double countTemp;

  CityAndCount.build({this.city, this.countTemp});
}
