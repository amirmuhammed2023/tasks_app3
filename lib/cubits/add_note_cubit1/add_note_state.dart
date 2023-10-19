part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class LoadingNote extends AddNoteInitial {} 

final class SucceededNote extends AddNoteInitial {} 

final class FailuredNote extends AddNoteInitial {
  final String errmMssage  ;

  FailuredNote(this.errmMssage);
} 

