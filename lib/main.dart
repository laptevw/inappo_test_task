import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/example_bloc.dart';
import 'package:test_task/data/example_repository.dart';
import 'package:test_task/view/main/main_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ExampleBloc(ExampleRepository()),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
