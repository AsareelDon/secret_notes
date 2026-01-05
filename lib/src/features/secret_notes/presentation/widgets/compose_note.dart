import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/container_wrapper.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/primary_app_bar.dart';

class ComposeNotePage extends StatefulWidget {
  final NoteEntity? noteEntity;

  const ComposeNotePage({super.key, this.noteEntity});

  @override
  State<ComposeNotePage> createState() => _ComposeNotePageState();
}

class _ComposeNotePageState extends State<ComposeNotePage> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;

  final devLogger = DevLogger.singleton;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteEntity?.noteTitle);
    _contentController = TextEditingController(text: widget.noteEntity?.noteContent);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveNote() {
    final createdNote = NoteEntity(
      noteId: widget.noteEntity?.noteId,
      noteTitle: _titleController.text.trim(),
      noteContent: _contentController.text.trim(),
      creationDate: widget.noteEntity?.creationDate?? DateTime.now(),
      lastEditDate: DateTime.now()
    );

    context.read<CreateNoteCubit>().createNote(createdNote);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateNoteCubit, CreateNoteState>(
      listener: (context, state) {
        if (state is CreateNoteSuccess) {
          final response = state.noteResponse;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message)),
          );
          Navigator.pop(context);
        } else if (state is CreateNoteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: _noteWidgetBody(context),
    );
  }

  Widget _noteWidgetBody(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PrimaryAppBar(
        title: "Notes",
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        actionButtons: [
          IconButton(
            icon: const Icon(
              Icons.check_rounded,
              color: Colors.black87,
              size: 34,
            ),
            onPressed: _saveNote,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF9FAFB)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContainerWrapper(
                  withBoxDecoration: false,
                  paddingEdges: 0,
                  child: TextField(
                    autofocus: true,
                    controller: _titleController,
                    cursorColor: Color(0xFF2563EB),
                    style: const TextStyle(color: Colors.black87, fontSize: 27, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 27, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                ContainerWrapper(
                  paddingEdges: 0,
                  withBoxDecoration: false,
                  child: TextField(
                    controller: _contentController,
                    cursorColor: Color(0xFF2563EB),
                    style: const TextStyle(color: Colors.black87, fontSize: 20),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Note something here",
                      hintStyle: TextStyle(color: Colors.grey[500], fontSize: 20),
                    ),
                    maxLines: null,
                  ),
                )
              ],
            )
          )
        ),
      ),
    );
  }
}