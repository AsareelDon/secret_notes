import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/pages/compose_note_page.dart';

class NoteTile extends StatefulWidget {
  final NoteEntity noteEntity;
  final String dateCreated;
  final int noteTileIndex;

  const NoteTile({
    super.key,
    required this.noteEntity,
    required this.dateCreated,
    required this.noteTileIndex
  });

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Slidable(
        key: ValueKey(widget.noteTileIndex),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.25,
          children: [
            SlidableAction(
              onPressed: (context) {
                context.read<DeleteNoteCubit>().deleteNoteById(widget.noteEntity.noteId!);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              title: Text(widget.noteEntity.noteTitle),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              subtitle: Text(
                "${widget.dateCreated} ${widget.noteEntity.noteContent}",
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<CreateNoteCubit>(),
                      child: ComposeNotePage(noteEntity: widget.noteEntity),
                    )
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
