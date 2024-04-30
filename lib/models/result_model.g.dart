// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResultModelAdapter extends TypeAdapter<ResultModel> {
  @override
  final int typeId = 0;

  @override
  ResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ResultModel(
      result: fields[0] as String,
      subtitle: fields[1] as String,
      message: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.result)
      ..writeByte(1)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
