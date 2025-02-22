// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_bloc.dart';
import 'package:noteapp_clean_architecture/application/utils/utils.dart';
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
        //state is what bloc emits
        builder: (context, state) {
          // if the bloc emits a NotesLoading show loading indicator
          if (state is NotesLoading) {
            return const Center(
              //loading indicator
              child: CircularProgressIndicator(),
            );
            // if the bloc emits a NotesLoaded then it return the List of notes
          } else if (state is NotesLoaded) {
            //call the notelist ui and pass the argument notes from the state
            return NoteList(notes: state.notes);
          } else if (state is NotesError) {
            CustomLog.error(message: 'home-error', object: state.message);
          }
          //if nothing on state
          return const Center(
            child: Column(
              children: [
                Text('No Notes'),
              ],
            ),
          );
        },
      ),
    );
  }
}
