// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_list_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishListAdapter extends TypeAdapter<WishList> {
  @override
  final int typeId = 0;

  @override
  WishList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishList(
      name: fields[0] as String,
      poster: fields[1] as String,
      vote: fields[2] as double,
      id: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WishList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.poster)
      ..writeByte(2)
      ..write(obj.vote)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
