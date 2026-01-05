import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/core/utils/app_logger.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/container_wrapper.dart';

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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 34,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 34,
            ),
            onPressed: _saveNote,
          )
        ],
        title: const Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal,
              Color(0xFFB2EBF2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
                        style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Title",
                          hintStyle: TextStyle(color: Colors.white38, fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ContainerWrapper(
                      paddingEdges: 0,
                      withBoxDecoration: false,
                      child: TextField(
                        controller: _contentController,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Note something here",
                          hintStyle: TextStyle(color: Colors.white38, fontSize: 20),
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