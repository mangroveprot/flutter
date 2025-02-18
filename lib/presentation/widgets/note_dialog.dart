import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_bloc.dart';
import 'package:noteapp_clean_architecture/application/bloc/notes_event.dart';
import 'package:noteapp_clean_architecture/application/utils/utils.dart';
import 'package:noteapp_clean_architecture/data/models/note_model.dart';

void openNoteBox(BuildContext context, NoteModel? notemodel) {
  // Capture the input in textfield
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // Give initial value of the controller if theres a notemodel id included
  titleController.text = notemodel?.title ?? "";
  contentController.text = notemodel?.content ?? "";

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Enter Details",
          style: TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: contentController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            CustomLog.success(
                object: {'id': notemodel?.id, 'title': notemodel?.title});
            //add new note if notemodel id is empty
            if (notemodel == null) {
              context.read<NotesBloc>().add(AddNoteEvent(NoteModel(
                    id: '',
                    title: titleController.text,
                    content: contentController.text,
                    createdAt: Timestamp.fromDate(DateTime.now()),
                    updatedAt: Timestamp.fromDate(DateTime.now()),
                  )));
              //update notes if notemodel id has value
            } else {
              CustomLog.success(object: 'IM_OKAY');
              context.read<NotesBloc>().add(UpdateNoteEvent(NoteModel(
                    id: notemodel.id,
                    title: titleController.text,
                    content: contentController.text,
                    createdAt: notemodel.createdAt,
                    updatedAt: Timestamp.fromDate(DateTime.now()),
                  )));
            }
            //Close the dialog box
            Navigator.pop(context);
          },
          child: Text(notemodel == null ? 'Add' : 'Update'),
        )
      ],
    ),
  );
}
