import 'package:bloc/bloc.dart';
import 'package:quiknote/bloc/note_cubit/note_cubit_state.dart';
import 'package:quiknote/sqliteDB/quiknote_services.dart';

class NoteCubit extends Cubit<NoteState> {
  final QuiknoteServices _quiknoteServices;
  NoteCubit(this._quiknoteServices) : super(NoteInitial());

  Future<void> fetAllNotes() async {
    try {
      emit(NoteLoading());
      final noteData = await _quiknoteServices.getAllNotes("notes", 0);
      emit(NoteLoaded(noteData));
      print(noteData.length);
    } catch (e) {
      emit(NoteError("Failed to fetach note data."));
    }
  }

  Future<void> insertNoteAndFetch(Map<String, dynamic> noteData) async {
    try {
      await _quiknoteServices.insertData("notes", noteData);
      await fetAllNotes();
    } catch (e) {
      emit(NoteError("Failed to insert note."));
    }
  }
}
