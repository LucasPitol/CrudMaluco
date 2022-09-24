import 'package:flutter/material.dart';

class NewPersonForm {
  late TextEditingController name;
  late String country;

  NewPersonForm() {
    this.name = TextEditingController();
    this.country = '';
  }
}