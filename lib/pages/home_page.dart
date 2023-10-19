import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app3/cubits/notes_item_cubit2/notes_item_dart_cubit.dart';
import 'package:tasks_app3/helpers/custom_appbar.dart';
import 'package:tasks_app3/helpers/custom_item_note.dart';
import 'package:tasks_app3/helpers/custom_modalsheet.dart';
import 'package:tasks_app3/helpers/mycolors.dart';
import 'package:tasks_app3/models/noteemodel.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  notemodel? notesclear;

  @override
  void initState() {
    BlocProvider.of<NotesItemDartCubit>(context).showmynoted() ;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            //isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            builder: (context) {
              return modalsheet();
            },
          );
        },
        backgroundColor: kprimarycolor,
        child: Icon(
          Icons.add,
          size: 28,
        ),
      ),
      appBar: AppBar(
        title: Text("Home page"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          iconappbar(
            iconpage: Icon(Icons.search),
            onPressed:(){
            },
            ),
        ],
      ),
      body: itemnote(),
    );
  }
}
