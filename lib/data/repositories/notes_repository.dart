import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NotesRepository {
  //pointing the collection to use
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  //Create
  /*Example 
  title: Exam
  content: Todays exam
  timestamp: 12/24/2025
  */
  Future<void> addNote(NoteModel note) async {
    await notesCollection.add(note.toDocument());
  }

  //Read
  //The output of this List
  /*
  Example;
  [
  NoteModel(title: "Note 3", content: "Content of Note 3", timestamp: DateTime(2025, 2, 3, 8, 0)),
  NoteModel(title: "Note 2", content: "Content of Note 2", timestamp: DateTime(2025, 2, 2, 12, 0)),
  NoteModel(title: "Note 1", content: "Content of Note 1", timestamp: DateTime(2025, 2, 1, 10, 0)),
  ] */
  Stream<List<NoteModel>> getNotesStream() {
    return notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots() //this listen for real-time changes in notesCollection
        .map((snapshot) => snapshot.docs
            .map((doc) => NoteModel.fromSnapshot(doc))
            .toList()); // convert the notemodel result to list
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
