import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_bloc.dart';
import 'package:noteapp_clean_architecture/presentation/widgets/note_dialog.dart';
import 'package:noteapp_clean_architecture/presentation/widgets/note_list.dart';

import '../../application/bloc/notes_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTES'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNoteBox(context, null);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            //show the progress indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NotesLoaded) {
            return NoteList(notes: state.notes);
          } else if (state is NotesError) {}
          //if nothing on state
          return const Center(
            child: Text('No Notes'),
          );
        },
      ),
    );
  }
}
