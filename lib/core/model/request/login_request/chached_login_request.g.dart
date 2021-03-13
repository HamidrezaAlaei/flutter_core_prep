// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chached_login_request.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedLoggedUserAdapter extends TypeAdapter<CachedLoggedUser> {
  @override
  final int typeId = 1;

  @override
  CachedLoggedUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedLoggedUser(
      userName: fields[0] as String,
      passWord: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedLoggedUser obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.passWord);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedLoggedUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
