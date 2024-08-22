import 'package:flutter/material.dart';
import 'package:projeto_pokedex/core/core.dart';

import 'app/app_dependencies.dart';
import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BaseAppRun(dependencies: AppDependecies(), child: const AppWidget()));
}
