import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: child,
    );
  }
}
