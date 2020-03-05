import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/models/client.dart';
import 'package:crud_maluco_app/models/client_item.dart';
import 'package:crud_maluco_app/models/clinet_form.dart';

class ClientService {
  final dbReference = Firestore.instance;

  Future<List<ClientItem>> getClientList() async {
    List<ClientItem> clientItemList = new List<ClientItem>();

    await dbReference
        .collection('client')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((item) {
        var obj = item.data;

        var client = ClientItem.build(name: obj['name'], email: obj['email']);

        clientItemList.add(client);
      });

      return clientItemList.sort((a, b) => a.name.compareTo(b.name));
    }).catchError((onError) {
      print(onError);
      return [];
    });

    return clientItemList;
  }

  Future<Map<String, double>> getGraphData() async {
    Map<String, double> regionalMapLocal = new Map<String, double>();

    CityAndCount belemDoParaTemp =
        CityAndCount.build(city: 'Belem do Pará', countTemp: 0.0);
    CityAndCount pernambucoTemp =
        CityAndCount.build(city: 'Pernambuco', countTemp: 0.0);
    CityAndCount rioTemp =
        CityAndCount.build(city: 'Rio de Janeiro', countTemp: 0.0);
    CityAndCount saoPauloTemp =
        CityAndCount.build(city: 'São Paulo', countTemp: 0.0);

    await dbReference
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

      regionalList.forEach((element) {
        regionalMapLocal.putIfAbsent(element.city, () => element.countTemp);
      });

      return regionalMapLocal;
    }).catchError((onError) {
      print(onError);
      return regionalMapLocal;
    });
    return regionalMapLocal;
  }

  Future<void> save(ClientForm clientForm) async {

    await dbReference.collection('client').add({
      'address': clientForm.address.text,
      'birthDate': Timestamp.fromDate(clientForm.birthDate),
      'cidade': clientForm.cidade.text,
      'cpf': clientForm.cpf.text,
      'email': clientForm.email.text,
      'name': clientForm.name.text,
    });
  }
}

class CityAndCount {
  String city;
  double countTemp;

  CityAndCount.build({this.city, this.countTemp});
}
