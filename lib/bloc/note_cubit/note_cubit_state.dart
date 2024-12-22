abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<Map<String, dynamic>> noteList;

  NoteLoaded(this.noteList);
}

class NoteUpdated extends NoteState {}

class NoteError extends NoteState {
  final String message;

  NoteError(this.message);
}
