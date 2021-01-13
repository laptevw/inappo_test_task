import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/data/example_repository.dart';
import 'package:test_task/view/main/main_screen_events.dart';
import 'package:test_task/view/main/main_screen_states.dart';

class ExampleBloc extends Bloc<MainScreenEvent, MainScreenState> {

  ExampleRepository exampleRepository;

  ExampleBloc(this.exampleRepository) : super(MainScreenExampleState());

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    yield MainScreenExampleState();
  }

}