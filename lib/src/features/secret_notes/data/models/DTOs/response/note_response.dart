import 'package:equatable/equatable.dart';

class NoteResponse<T> extends Equatable {
  final bool isSuccess;
  final String message;
  final T? noteData;

  const NoteResponse({
    required this.isSuccess,
    required this.message,
    this.noteData,
  });

  factory NoteResponse.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return NoteResponse(
      isSuccess: json['isSuccess'],
      message: json['message'],
      noteData: json['noteData'] != null ? fromJson(json['noteData']) : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJson) {
    return {
      'isSuccess': isSuccess,
      'message': message,
      'noteData': noteData != null ? toJson(noteData as T) : null,
    };
  }

  @override
  List<Object?> get props => [isSuccess, message, noteData];
}