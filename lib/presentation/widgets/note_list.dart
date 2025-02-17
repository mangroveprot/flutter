import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_event.dart';
import 'package:noteapp_clean_architecture/application/utils/utils.dart';
import 'package:noteapp_clean_architecture/data/models/note_model.dart';
import 'package:noteapp_clean_architecture/presentation/widgets/note_dialog.dart';

class NoteList extends StatelessWidget {
  final List<NoteModel> notes;
  const NoteList({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          //access for each notes
          final note = notes[index];

          //Display a list tile notes
          return ListTile(
            //note title
            title: Text(note.title),
            subtitle: Text(formatDate(note.createdAt)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Edit button
                IconButton(
                  onPressed: () => {
                    openNoteBox(
                      context,
                      NoteModel(
                        id: note.id,
                        title: note.title,
                        content: note.content,
                        createdAt: note.createdAt,
                        updatedAt: note.updatedAt,
                      ),
                    )
                  },
                  icon: const Icon(Icons.edit),
                ),
                //Delete button
                IconButton(
                  onPressed: () => {
                    context.read<NotesBloc>().add(
                          DeleteNoteEvent(note.id),
                        )
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        });
  }
}
