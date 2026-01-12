import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';
import 'package:secret_notes/src/features/secret_notes/data/models/note_model.dart';

/// This module exposes a [Box<NoteModel>] instance derived from the
/// ObjectBox [Store]. Since [Box] creation requires runtime access to
/// the [Store], it is declared here instead of using a constructor.
@module
abstract class RegisterModule {

  /// Provides a lazily-initialized ObjectBox [Box] for [NoteModel].
  ///
  /// The [Box] is created from the injected [Store] and registered
  /// as a lazy singleton, meaning it will be instantiated only when
  /// first requested.
  ///
  /// This ensures:
  /// - A single shared [Box] instance across the app
  /// - Reduced startup cost
  /// - Proper lifecycle management by GetIt
  @lazySingleton
  Box<NoteModel> noteBox(Store store) => store.box<NoteModel>();
}
