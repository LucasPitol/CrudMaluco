import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientForm {
  TextEditingController address;
  Timestamp birthDate;
  TextEditingController cidade;
  TextEditingController cpf;
  TextEditingController email;
  TextEditingController name;

  ClientForm() {
    this.address = TextEditingController();
    this.cidade = TextEditingController();
    this.cpf = TextEditingController();
    this.email = TextEditingController();
    this.name = TextEditingController();
  }
}