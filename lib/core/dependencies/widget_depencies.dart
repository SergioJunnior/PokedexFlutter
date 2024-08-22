import 'package:flutter/material.dart';
import 'package:projeto_pokedex/core/dependencies/base_dependencies.dart';

import 'dependencies_get_it.dart';

abstract class DependenciesWidget extends StatefulWidget {
  final Widget child;
  final BaseDependencies dependencies;

  const DependenciesWidget({
    super.key,
    required this.child,
    required this.dependencies,
  });

  @override
  State<DependenciesWidget> createState() => _DependenciesWidgetState();
}

class _DependenciesWidgetState extends State<DependenciesWidget> {
  @override
  void initState() {
    widget.dependencies.dependencies(Dependencies.I);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
