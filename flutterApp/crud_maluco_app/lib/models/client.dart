import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String address;
  Timestamp birthDate;
  String city;
  String cpf;
  String email;
  String name;

  Client.build({
    this.address,
    this.birthDate,
    this.city,
    this.cpf,
    this.email,
    this.name,
  });
}