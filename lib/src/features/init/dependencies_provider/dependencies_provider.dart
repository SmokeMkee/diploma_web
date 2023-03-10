import 'package:flutter/material.dart';

import 'widgets/repos_provider.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.builder});

  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return ReposProvider(
      child: Builder(builder: builder)
    );
  }
}
