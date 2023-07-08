// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preference_datastore.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppPreferenceDatastoreAdapter
    extends TypeAdapter<AppPreferenceDatastore> {
  @override
  final int typeId = 0;

  @override
  AppPreferenceDatastore read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppPreferenceDatastore(
      isEbook: fields[0] as bool,
      keyword: fields[1] as String?,
      isPortuguese: fields[2] as bool,
      subject: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppPreferenceDatastore obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.isEbook)
      ..writeByte(1)
      ..write(obj.keyword)
      ..writeByte(2)
      ..write(obj.isPortuguese)
      ..writeByte(3)
      ..write(obj.subject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPreferenceDatastoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
