import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/read/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/read/get_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/pages/compose_note_page.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/note_tile.dart';
import 'package:secret_notes/src/core/ui/primary_app_bar.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<GetNoteCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PrimaryAppBar(
        title: "Notes",
        automaticallyImplyLeading: false
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        child: SafeArea(
          child: MultiBlocListener(
            listeners: [
              BlocListener<CreateNoteCubit, CreateNoteState>(
                listener: (context, state) {
                  state.maybeWhen(
                    successOnCreateNotes: (isSuccess) {
                      if (isSuccess) {
                        context.read<GetNoteCubit>().getAllNotes();
                      }
                    }, orElse: () {  },
                  );
                }
              ),
              BlocListener<DeleteNoteCubit, DeleteNoteState>(
                listener: (context, state) {
                  state.maybeWhen(
                    successOnDeleteNotes: (isSuccess) {
                      if (isSuccess) {
                        context.read<GetNoteCubit>().getAllNotes();
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
                        context.read<GetNoteCubit>().getAllNotes();
                      }
                    }, orElse: () {  },
                  );
                }
              ),
            ],
            child: BlocBuilder<GetNoteCubit, GetNoteState>(
              builder: (context, state) {
                return state.when(
                  initialNotes: () => const SizedBox.shrink(),
                  loadingNotes: () => const Center(child: CircularProgressIndicator()),

                  successOnFetchNotes: (notes) {
                    if (notes.isEmpty) {
                      return const Center(child: Text('No notes found'));
                    }

                    return ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        final dateCreated = DateFormat('MM/dd/yyyy')
                          .format(note.lastEditDate ?? note.creationDate);

                        return NoteTile(
                          noteEntity: note,
                          dateCreated: dateCreated,
                          noteTileIndex: index,
                        );
                      },
                    );
                  },

                  errorOnFetchNotes: (_) => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).bottomAppBarTheme.color,
        elevation: Theme.of(context).bottomAppBarTheme.elevation,
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: context.read<CreateNoteCubit>(),
                  child: ComposeNotePage(),
                )
              ),
            );
          },
          child: SizedBox(
            height: 60,
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.post_add_rounded, color: Theme.of(context).primaryColor, size: 34),
                  Text("New Note", style: Theme.of(context).textTheme.labelSmall),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}