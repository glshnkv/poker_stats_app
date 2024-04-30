part of 'result_bloc.dart';

@immutable
abstract class ResultEvent {}

class GetResultEvent extends ResultEvent {}

class AddResultEvent extends ResultEvent {
  final ResultModel result;

  AddResultEvent({required this.result});
}