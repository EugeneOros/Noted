
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'note.freezed.dart';

part 'note.g.dart';

@freezed
class Note with _$Note{
  factory Note({
    String? id,
    required DateTime created,
    required String title,
    required String? note,
    required String? url,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}