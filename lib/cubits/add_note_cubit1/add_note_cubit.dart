import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app3/helpers/mycolors.dart';
import 'package:tasks_app3/models/noteemodel.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  

  int? notecolor ;
  addnote(notemodel note) async{
    note.color = notecolor! ;
    emit(LoadingNote()) ;
    try {
      var myboxnotes = Hive.box<notemodel>(kboxname) ;
      await myboxnotes.add(note) ;
      emit(SucceededNote());
    } catch (e) {
      emit(FailuredNote(e.toString()));
    }
  }
}
