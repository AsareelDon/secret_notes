import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';
import 'package:secret_notes/src/core/ui/container_wrapper.dart';
import 'package:secret_notes/src/core/ui/primary_app_bar.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_state.dart';

class ComposeNotePage extends StatefulWidget {
  final NoteEntity? noteEntity;

  const ComposeNotePage({super.key, this.noteEntity});

  @override
  State<ComposeNotePage> createState() => _ComposeNotePageState();
}

class _ComposeNotePageState extends State<ComposeNotePage> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.noteEntity?.noteTitle);
    _contentController = TextEditingController(text: widget.noteEntity?.noteContent);

    _titleController.addListener(_checkIfNoteIsEmpty);
    _contentController.addListener(_checkIfNoteIsEmpty);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _checkIfNoteIsEmpty() {
    setState(() {
      _isEnabled = _titleController.text.isNotEmpty || _contentController.text.isNotEmpty;
    });
  }

  void _saveNote() {
    if (widget.noteEntity != null) {
      final editedNote = widget.noteEntity!.update(
        title: _titleController.text,
        content: _contentController.text,
      );
      context.read<EditNoteCubit>().editNoteById(editedNote);
    } else {
      final createdNote = NoteEntity.fromInput(
        title: _titleController.text,
        content: _contentController.text,
      );
      context.read<CreateNoteCubit>().createNote(createdNote);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CreateNoteCubit, CreateNoteState>(
          listener: (context, state) {
            state.maybeWhen(
              successOnCreateNotes: (isSuccess) {
                if (isSuccess) {
                  Navigator.pop(context);
                }
              }, orElse: () {  },
            );
          }
        ),
        BlocListener<EditNoteCubit, EditNoteState>(
          listener: (context, state) {
            state.maybeWhen(
              successOnEditNotes: (isSuccess) {
                if (isSuccess) {
                  Navigator.pop(context);
                }
              }, orElse: () {  },
            );
          }
        ),
      ],
      child: _noteWidgetBody(context)
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
          if (_isEnabled)
            IconButton(
              icon: Icon(
                Icons.check_rounded,
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
                size: Theme.of(context).appBarTheme.actionsIconTheme?.size,
              ),
              onPressed: _saveNote,
            )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
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
                    cursorColor: Theme.of(context).primaryColor,
                    style: Theme.of(context).textTheme.titleLarge,
                    decoration: InputDecoration(
                      border: Theme.of(context).inputDecorationTheme.border,
                      hintText: "Title",
                      hintStyle: TextStyle(
                        color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                        fontSize: 27,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                ContainerWrapper(
                  paddingEdges: 0,
                  withBoxDecoration: false,
                  child: TextField(
                    controller: _contentController,
                    cursorColor: Theme.of(context).primaryColor,
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: InputDecoration(
                      border: Theme.of(context).inputDecorationTheme.border,
                      hintText: "Note something here",
                      hintStyle: TextStyle(
                        color: Theme.of(context).inputDecorationTheme.hintStyle?.color,
                        fontSize: 20
                      ),
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