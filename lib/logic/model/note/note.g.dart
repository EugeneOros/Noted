// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Note _$$_NoteFromJson(Map<String, dynamic> json) => _$_Note(
      id: json['id'] as String?,
      created: DateTime.parse(json['created'] as String),
      title: json['title'] as String,
      note: json['note'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_NoteToJson(_$_Note instance) => <String, dynamic>{
      'id': instance.id,
      'created': instance.created.toIso8601String(),
      'title': instance.title,
      'note': instance.note,
      'url': instance.url,
    };
