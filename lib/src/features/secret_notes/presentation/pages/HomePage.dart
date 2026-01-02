import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/get_note_state.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/ContainerWrapper.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/NotePage.dart';
import 'package:intl/intl.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/widgets/primary_app_bar.dart';

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
      appBar: PrimaryAppBar(title: "Notes"),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Color(0xFFB2EBF2)],
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
                _buildSearchBar(),
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
                            return _buildNoteTile(
                              title: note.noteTitle,
                              content: note.noteContent,
                              date: displayDate,
                              accentColor: Colors.teal,
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
                    child: NotePage(),
                  )
              ),
            );
          },
          child: SizedBox(
            height: 60,
            child: Center(
              child: Icon(
                Icons.post_add_rounded,
                color: Colors.black87,
                size: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          icon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search notes',
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildNoteTile({
    required String title,
    required String content,
    required String date,
    required Color accentColor,
  }) {
    return ContainerWrapper(
      withBoxDecoration: true,
      paddingEdges: 16,
      containerColor: Colors.white.withValues(alpha: 0.85),
      shadowColor: Colors.black.withValues(alpha: 0.08),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 60,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF004D40),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}