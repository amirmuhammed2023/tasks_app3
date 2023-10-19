import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:tasks_app3/helpers/mycolors.dart';
import 'package:tasks_app3/models/noteemodel.dart';

part 'notes_item_dart_state.dart';

class NotesItemDartCubit extends Cubit<NotesItemDartState> {
  NotesItemDartCubit() : super(NotesItemDartInitial());
  
  List<notemodel>? mynotes ;
  showmynoted(){
    var notes = Hive.box<notemodel>(kboxname);

    mynotes = notes.values.toList() ;

    emit(succeednote());
  }


}
