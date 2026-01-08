import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/app/app.dart';
import 'package:secret_notes/src/core/database/objectbox.dart';
import 'package:secret_notes/src/features/secret_notes/data/datasources/notes_local_datasource_impl.dart';
import 'package:secret_notes/src/features/secret_notes/data/repositories/note_repository_impl.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/create_note_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/read/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBoxInit = await ObjectBox.create();
  final notesLocalDataSource = NotesLocalDataSourceImpl(store: objectBoxInit.store);
  final notesRepository = NoteRepositoryImpl(notesLocalDataSource: notesLocalDataSource);
  final createNoteUseCase = CreateNoteUseCase(noteRepository: notesRepository);
  final getAllNotesUsecase = GetAllNotesUsecase(noteRepository: notesRepository);
  final editNoteByIdUseCase = EditNoteByIdUseCase(noteRepository: notesRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CreateNoteCubit(createNoteUseCase: createNoteUseCase)),
        BlocProvider(create: (context) => GetNoteCubit(getAllNotesUsecase: getAllNotesUsecase)),
        BlocProvider(create: (context) => EditNoteCubit(editNoteByIdUseCase: editNoteByIdUseCase))
      ],
      child: MyApp(),
    )
  );
}
