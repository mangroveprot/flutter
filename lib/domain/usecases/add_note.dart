import '../../data/repositories/notes_repository.dart';
import '../../data/models/note_model.dart';

class AddNote {
  final NotesRepository repository;

  AddNote({required this.repository});

  Future<void> call(NoteModel note) async {
    return await repository.addNote(note);
  }
}
