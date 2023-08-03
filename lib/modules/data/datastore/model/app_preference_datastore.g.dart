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
      isPortuguese: fields[1] as bool,
      subject: fields[2] as String?,
      title: fields[3] as String?,
      keyword: fields[6] as String?,
      orderBy: fields[7] as String?,
      author: fields[4] as String?,
      editor: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AppPreferenceDatastore obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.isEbook)
      ..writeByte(1)
      ..write(obj.isPortuguese)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.editor)
      ..writeByte(6)
      ..write(obj.keyword)
      ..writeByte(7)
      ..write(obj.orderBy);
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
