import '../../data/repositories/notes_repository.dart';
import '../../data/models/note_model.dart';

class GetNotes {
  final NotesRepository repository;

  GetNotes({required this.repository});

  Stream<List<NoteModel>> call() {
    return repository.getNotesStream();
  }
}
