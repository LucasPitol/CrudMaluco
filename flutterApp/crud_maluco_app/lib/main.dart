import 'package:crud_maluco_app/listagem_component.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CDState();
  }
}

class _CDState extends State<MyApp> {
  FloatingActionButtonLocation _addFabLocation =
      FloatingActionButtonLocation.endDocked;

  void openFilter() {
    var x = 1;

    var y = x + 1;

    x = y + 1;
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
            onTap: openFilter,
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
          child: ListagemComponent(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: openFilter,
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
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => Container(
                color: Colors.white,
                alignment: Alignment.center,
                height: 200,
                child: Text(
                  'filtro',
                ),
              ),
            ),
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
