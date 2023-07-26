import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'core/injection/injection.dart';
import 'core/oruPhones.dart';

void main() async {
  configureDependencies(Environment.prod);
  runApp(const OruPhones());
}
