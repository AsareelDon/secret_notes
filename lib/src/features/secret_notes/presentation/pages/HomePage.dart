import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/compose_note.dart';
import 'package:intl/intl.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/note_tile_list.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/primary_app_bar.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/search_bar.dart';

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
        decoration: const BoxDecoration(
          color: Color(0xFFF9FAFB)
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(),
                const SizedBox(height: 12),
                Expanded(
                  child: BlocBuilder<GetNoteCubit, GetNoteState>(
                    builder: (context, state) {
                      if (state is GetNoteLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetNoteLoaded) {
                        final notes = state.notes;
                        if (notes.isEmpty) {
                          return const Center(child: Text("No notes found"));
                        }
                        return ListView.builder(
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            final note = state.notes[index];
                            final displayDate = DateFormat('yyyy-MM-dd – HH:mm')
                                .format(note.lastEditDate ?? note.creationDate);
                            return NoteTileList(
                              title: note.noteTitle,
                              content: note.noteContent,
                              date: displayDate,
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    }
                  ),
                )
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
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
                  Icon(
                    Icons.post_add_rounded,
                    color: Color(0xFF2563EB),
                    size: 34,
                  ),
                  Text(
                    "New Note",
                    style: TextStyle(
                      color: Color(0xFF2563EB),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}