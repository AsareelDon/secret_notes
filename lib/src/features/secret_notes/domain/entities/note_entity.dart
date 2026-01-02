import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  final int? noteId;
  final String noteTitle;
  final String noteContent;
  final DateTime creationDate;
  final DateTime? lastEditDate;

  const NoteEntity({
    this.noteId,
    required this.noteTitle,
    required this.noteContent,
    required this.creationDate,
    this.lastEditDate,
  });

  @override
  List<Object?> get props => [
    noteId,
    noteTitle,
    noteContent,
    creationDate,
    lastEditDate,
  ];

  NoteEntity toEntity() {
    return NoteEntity(
      noteId: noteId,
      noteTitle: noteTitle,
      noteContent: noteContent,
      creationDate: creationDate,
      lastEditDate: lastEditDate,
    );
  }
}