import 'package:objectbox/objectbox.dart';

@Entity()
class NoteModel {
  @Id()
  int noteId;
  String noteTitle;
  String noteContent;
  DateTime creationDate;
  DateTime? lastEditDate;

  NoteModel({
    this.noteId = 0,
    required this.noteTitle,
    required this.noteContent,
    required this.creationDate,
    this.lastEditDate,
  });
}