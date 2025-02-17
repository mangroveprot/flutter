import '../../data/models/note_model.dart';

abstract class NotesEvent {}

class LoadNotes extends NotesEvent {}

class AddNoteEvent extends NotesEvent {
  final NoteModel note;
  AddNoteEvent(this.note);
}

class UpdateNoteEvent extends NotesEvent {
  final NoteModel note;
  UpdateNoteEvent(this.note);
}

class DeleteNoteEvent extends NotesEvent {
  final String docID;
  DeleteNoteEvent(this.docID);
}
