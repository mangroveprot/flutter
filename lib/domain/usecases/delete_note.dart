import '../../data/repositories/notes_repository.dart';

class DeleteNote {
  final NotesRepository repository;

  DeleteNote({required this.repository});

  Future<void> call(String docID) async {
    return await repository.deleteNote(docID);
  }
}
