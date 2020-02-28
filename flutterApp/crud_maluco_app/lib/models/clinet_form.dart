import 'package:flutter/material.dart';

class ClientForm {
  TextEditingController address;
  DateTime birthDate;
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