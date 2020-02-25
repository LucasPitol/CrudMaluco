import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/models/client_item.dart';

class ClientService {

  // final dbReference = Firestore.instance;

  void getClients() {
    List<ClientItem> clientItemList = new List<ClientItem>();

    // dbReference.collection('client')
    //   .getDocuments()
    //   .then((QuerySnapshot snapshot) {
    //     snapshot.documents.forEach((item) {
    //       var obj = item.data;
    //       print(obj);
    //       // var client = ClientItem.build(name: obj['name'], email: obj['email']);

    //       // clientItemList.add(client);
    //     });
    //   });
  }
}