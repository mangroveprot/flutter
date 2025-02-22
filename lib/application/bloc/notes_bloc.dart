import 'package:flutter_bloc/flutter_bloc.dart';
import 'notes_event.dart';
import 'notes_state.dart';
import '../../domain/usecases/get_notes.dart';
import '../../domain/usecases/add_note.dart';
import '../../domain/usecases/update_note.dart';
import '../../domain/usecases/delete_note.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotes getNotes;
  final AddNote addNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;

  NotesBloc(
      {required this.getNotes,
      required this.addNote,
      required this.updateNote,
      required this.deleteNote})
      // starting state
      : super(NotesInital()) {
    //Load State
    on<LoadNotes>((event, emit) async {
      emit(NotesLoading()); // this tells the ui to load
      try {
        //this properly awaits the stream of notes
        await for (var notes in getNotes()) {
          emit(NotesLoaded(notes));
        }
      } catch (e) {
        //debug purposes
        //CustomLog.error(message: 'BLOC_ERR', object: e.toString());
        emit(NotesError(e.toString()));
      }
    });

    // Add State
    on<AddNoteEvent>((event, emit) async {
      await addNote(event.note);
    });
    //Update State
    on<UpdateNoteEvent>((event, emit) async {
      await updateNote(event.note);
    });
    //Delete State
    on<DeleteNoteEvent>((event, emit) async {
      await deleteNote(event.docID);
    });
  }
}
