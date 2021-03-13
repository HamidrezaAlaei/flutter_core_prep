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
      rememberPass: fields[2] as bool,
      keepLoggedIn: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CachedLoggedUser obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.passWord)
      ..writeByte(2)
      ..write(obj.rememberPass)
      ..writeByte(3)
      ..write(obj.keepLoggedIn);
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
