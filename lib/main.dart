import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tasks_app3/bloc_observer.dart';
import 'package:tasks_app3/cubits/notes_item_cubit2/notes_item_dart_cubit.dart';
import 'package:tasks_app3/helpers/mycolors.dart';
import 'package:tasks_app3/models/noteemodel.dart';
import 'package:tasks_app3/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(notemodelAdapter());
  await Hive.openBox<notemodel>(kboxname);
  Bloc.observer = myobserbver();
  runApp(const tasks3());
}

class tasks3 extends StatelessWidget {
  const tasks3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesItemDartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: homepage(),
      ),
    );
  }
}
