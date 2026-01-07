import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/features/secret_notes/domain/entities/note_entity.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/pages/compose_note_page.dart';

class NoteTile extends StatelessWidget {
  final NoteEntity noteEntity;
  final String dateCreated;

  const NoteTile({super.key, required this.noteEntity, required this.dateCreated});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(noteEntity.noteTitle),
          titleTextStyle: Theme.of(context).textTheme.titleMedium,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(noteEntity.noteContent, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 8),
              Text(dateCreated, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: context.read<CreateNoteCubit>(),
                  child: ComposeNotePage(noteEntity: noteEntity),
                )
              ),
            );
          },
        )
      ),
    );
  }
}
