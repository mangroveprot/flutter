import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_event.dart';
import 'package:noteapp_clean_architecture/data/repositories/notes_repository.dart';
import 'package:noteapp_clean_architecture/domain/usecases/add_note.dart';
import 'package:noteapp_clean_architecture/domain/usecases/delete_note.dart';
import 'package:noteapp_clean_architecture/domain/usecases/get_notes.dart';
import 'package:noteapp_clean_architecture/domain/usecases/update_note.dart';
import 'package:noteapp_clean_architecture/firebase_options.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Wrap the whole project with BlocProvider
    return BlocProvider(
      create: (context) => NotesBloc(
        getNotes: GetNotes(repository: NotesRepository()),
        addNote: AddNote(repository: NotesRepository()),
        updateNote: UpdateNote(repository: NotesRepository()),
        deleteNote: DeleteNote(repository: NotesRepository()),
      )..add(LoadNotes()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes',
        home: HomePage(),
      ),
    );
  }
}
