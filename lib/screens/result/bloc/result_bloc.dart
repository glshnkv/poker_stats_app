import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:poker_stats_app/models/result_model.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  ResultBloc() : super(ResultInitial()) {
    on<GetResultEvent>(_getResultHandler);
    on<AddResultEvent>(_addResultHandler);
  }

  void _getResultHandler(
      GetResultEvent event, Emitter<ResultState> emit) async {
    List<ResultModel> results = [];

    final resultBox = Hive.box('results');

    if (resultBox.isNotEmpty) {
      for (int i = 0; i < resultBox.length; i++) {
        results.add(resultBox.getAt(i));
      }

      emit(LoadedResultState(
          result: results.last));
    } else {
      emit(EmptyResultState());
    }
  }

  void _addResultHandler(
      AddResultEvent event, Emitter<ResultState> emit) async {
    final resultBox = Hive.box('results');
    resultBox.add(event.result);
  }
}