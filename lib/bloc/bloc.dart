import 'package:flutter_bloc/flutter_bloc.dart';

class Turist extends Cubit<TuristState> {
  Turist() : super(TuristDefaullt());
  List<String> data = [];
  int index = 0;

  void increase() {
    emit(TuristDefaullt());
    index++;
    data.add('value $index');
  }
}

abstract class TuristState {}

class TuristDefaullt implements TuristState {}
