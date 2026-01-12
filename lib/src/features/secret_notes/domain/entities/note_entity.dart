import 'package:freezed_annotation/freezed_annotation.dart';
part 'note_entity.freezed.dart';

/// Represents a Note in the application domain.
///
/// This class is immutable and uses Freezed for code generation,
/// providing `copyWith`, equality, and other utility methods.
/// It contains metadata like `noteId`, `creationDate`, and `lastEditDate`.
@freezed
abstract class NoteEntity with _$NoteEntity {
  /// Constructs a [NoteEntity] instance.
  ///
  /// [noteId] is optional and usually assigned by the data source.
  /// [noteTitle] and [noteContent] are required fields representing the note's title and content.
  /// [creationDate] is the timestamp when the note was created.
  /// [lastEditDate] is optional and represents the last modification timestamp.
  const factory NoteEntity({
    int? noteId,
    required String noteTitle,
    required String noteContent,
    required DateTime creationDate,
    DateTime? lastEditDate,
  }) = _NoteEntity;

  /// Creates a [NoteEntity] from raw input values.
  ///
  /// This is useful in the presentation layer when the user provides
  /// the note's title and content via a form.
  ///
  /// [noteId] can be provided if editing an existing note.
  /// [title] and [content] are required strings from user input.
  /// [creationDate] is optional; if not provided, the current date/time is used.
  /// The [lastEditDate] is automatically set to now.
  static NoteEntity fromInput({
    int? noteId,
    required String title,
    required String content,
    DateTime? creationDate,
  }) {
    final now = DateTime.now();
    return NoteEntity(
      noteId: noteId,
      noteTitle: title.trim(),
      noteContent: content.trim(),
      creationDate: creationDate ?? now,
      lastEditDate: now,
    );
  }
}

/// Extension methods for [NoteEntity] to provide instance-level utilities.
extension NoteEntityExtension on NoteEntity {
  /// Returns a copy of this [NoteEntity] with updated fields.
  ///
  /// [title] and [content] are optional parameters. If provided,
  /// they replace the corresponding fields; otherwise, the current
  /// values are kept. The [lastEditDate] is automatically updated
  /// to the current time.
  NoteEntity update({String? title, String? content}) {
    return copyWith(
      noteTitle: title ?? noteTitle,
      noteContent: content ?? noteContent,
      lastEditDate: DateTime.now(),
    );
  }
}