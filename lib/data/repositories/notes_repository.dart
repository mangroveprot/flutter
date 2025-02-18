import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NotesRepository {
  //pointing the collection to use
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  //Create
  Future<void> addNote(NoteModel note) async {
    await notesCollection.add(note.toDocument());
  }

  //Read
  Stream<List<NoteModel>> getNotesStream() {
    return notesCollection
        .orderBy('createdAt', descending: true)
        .snapshots() // Listen for real-time changes in notesCollection
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => NoteModel.fromSnapshot(doc))
          .toList(); // Convert the NoteModel result to list
    });
  }

  //Update
  Future<void> updateNote(NoteModel note) async {
    await notesCollection.doc(note.id).update(note.toDocument());
  }

  //Delete
  Future<void> deleteNote(String docID) async {
    await notesCollection.doc(docID).delete();
  }
}
