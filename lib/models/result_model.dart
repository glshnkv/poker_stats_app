
import 'package:hive_flutter/hive_flutter.dart';

part 'result_model.g.dart';

@HiveType(typeId: 0)
class ResultModel {
  @HiveField(0)
  final String result;
  @HiveField(1)
  final String subtitle;
  @HiveField(3)
  final String message;

  ResultModel(
      {required this.result,
        required this.subtitle,
        required this.message});
}
