import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/injection/injection.dart';
import 'core/oruPhones.dart';
// ignore_for_file: prefer_const_constructors

void main() async {
  configureDependencies(Environment.prod);
  runApp(const OruPhones());
}
