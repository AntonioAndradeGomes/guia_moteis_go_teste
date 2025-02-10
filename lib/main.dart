import 'package:flutter/material.dart';
import 'package:guia_moteis_go_teste/app/app_widget.dart';
import 'package:guia_moteis_go_teste/app/core/dependencies/dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  runApp(const AppWidget());
}
