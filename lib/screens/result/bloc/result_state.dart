part of 'result_bloc.dart';

@immutable
abstract class ResultState {}

class ResultInitial extends ResultState {}

class LoadedResultState extends ResultState {
  final ResultModel result;

  LoadedResultState({required this.result});
}

class EmptyResultState extends ResultState {}