import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/bloc/example_bloc.dart';
import 'package:test_task/view/main/main_screen_states.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleBloc, MainScreenState>(
      builder: (context, state) => Scaffold(
        body: Container(),
      ),
    );
  }
}
