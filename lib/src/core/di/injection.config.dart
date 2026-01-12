// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:objectbox/objectbox.dart' as _i1034;

import '../../../objectbox.g.dart' as _i941;
import '../../features/secret_notes/data/datasources/notes_local_datasource.dart'
    as _i106;
import '../../features/secret_notes/data/datasources/notes_local_datasource_impl.dart'
    as _i232;
import '../../features/secret_notes/data/models/note_model.dart' as _i220;
import '../../features/secret_notes/data/repositories/note_repository_impl.dart'
    as _i993;
import '../../features/secret_notes/domain/repository/note_repository.dart'
    as _i701;
import '../../features/secret_notes/domain/usecases/create_note_usecase.dart'
    as _i498;
import '../../features/secret_notes/domain/usecases/delete_note_by_id_usecase.dart'
    as _i255;
import '../../features/secret_notes/domain/usecases/edit_note_by_id_usecase.dart'
    as _i1008;
import '../../features/secret_notes/domain/usecases/get_all_notes_usecase.dart'
    as _i789;
import '../../features/secret_notes/presentation/cubit/create/create_note_cubit.dart'
    as _i660;
import '../../features/secret_notes/presentation/cubit/delete/delete_note_cubit.dart'
    as _i405;
import '../../features/secret_notes/presentation/cubit/read/get_note_cubit.dart'
    as _i571;
import '../../features/secret_notes/presentation/cubit/update/edit_note_cubit.dart'
    as _i48;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i1034.Box<_i220.NoteModel>>(
      () => registerModule.noteBox(gh<_i1034.Store>()),
    );
    gh.lazySingleton<_i106.NotesLocalDataSource>(
      () => _i232.NotesLocalDataSourceImpl(
        store: gh<_i941.Store>(),
        noteModelBox: gh<_i941.Box<_i220.NoteModel>>(),
      ),
    );
    gh.lazySingleton<_i701.NoteRepository>(
      () => _i993.NoteRepositoryImpl(
        notesLocalDataSource: gh<_i106.NotesLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i498.CreateNoteUseCase>(
      () => _i498.CreateNoteUseCase(noteRepository: gh<_i701.NoteRepository>()),
    );
    gh.lazySingleton<_i255.DeleteNoteByIdUseCase>(
      () => _i255.DeleteNoteByIdUseCase(
        noteRepository: gh<_i701.NoteRepository>(),
      ),
    );
    gh.lazySingleton<_i1008.EditNoteByIdUseCase>(
      () => _i1008.EditNoteByIdUseCase(
        noteRepository: gh<_i701.NoteRepository>(),
      ),
    );
    gh.lazySingleton<_i789.GetAllNotesUsecase>(
      () =>
          _i789.GetAllNotesUsecase(noteRepository: gh<_i701.NoteRepository>()),
    );
    gh.factory<_i660.CreateNoteCubit>(
      () => _i660.CreateNoteCubit(
        createNoteUseCase: gh<_i498.CreateNoteUseCase>(),
      ),
    );
    gh.factory<_i48.EditNoteCubit>(
      () => _i48.EditNoteCubit(
        editNoteByIdUseCase: gh<_i1008.EditNoteByIdUseCase>(),
      ),
    );
    gh.factory<_i571.GetNoteCubit>(
      () => _i571.GetNoteCubit(
        getAllNotesUsecase: gh<_i789.GetAllNotesUsecase>(),
      ),
    );
    gh.factory<_i405.DeleteNoteCubit>(
      () => _i405.DeleteNoteCubit(
        deleteNoteByIdUseCase: gh<_i255.DeleteNoteByIdUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
