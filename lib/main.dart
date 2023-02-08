import 'app/core/config/env.dart';
import 'app/dw_app.dart';
import 'package:flutter/material.dart';

void main() async {
  await Env.i.load();
  runApp(const DwApp());
}
