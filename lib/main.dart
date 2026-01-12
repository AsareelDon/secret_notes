import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secret_notes/src/app/app.dart';
import 'package:secret_notes/src/core/database/objectbox.dart';
import 'package:secret_notes/src/core/di/injection.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/create/create_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/delete/delete_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/read/get_note_cubit.dart';
import 'package:secret_notes/src/features/secret_notes/presentation/cubit/update/edit_note_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBoxInit = await ObjectBox.create();
  configureDependencies(store: objectBoxInit.store);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CreateNoteCubit>()),
        BlocProvider(create: (context) => getIt<GetNoteCubit>()),
        BlocProvider(create: (context) => getIt<EditNoteCubit>()),
        BlocProvider(create: (context) => getIt<DeleteNoteCubit>()),
      ],
      child: MyApp(),
    )
  );
}
