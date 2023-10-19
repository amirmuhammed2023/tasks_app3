import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app3/cubits/notes_item_cubit2/notes_item_dart_cubit.dart';
import 'package:tasks_app3/helpers/custom_appbar.dart';
import 'package:tasks_app3/helpers/custom_textfield.dart';
import 'package:tasks_app3/helpers/mycolors.dart';
import 'package:tasks_app3/models/noteemodel.dart';

class editnote extends StatelessWidget {
  const editnote({super.key, required this.notesedit});
  final notemodel notesedit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Edit Note"),
        actions: [
          iconappbar(
            iconpage: Icon(Icons.check),
            onPressed: () {
              notesedit.save();
              BlocProvider.of<NotesItemDartCubit>(context).showmynoted();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            textfield1(
              hint1: notesedit.address,
              onChanged: (value) {
                notesedit.address = value;
              },
            ),
            textfield1(
              hint1: notesedit.description,
              mxline: 5,
              textpaddingvertical: 50,
              onChanged: (value) {
                notesedit.description = value;
              },
            ),
            SizedBox(
              height: 30 * 2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Kallcolors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        notesedit.color = Kallcolors[index].value;
                      },
                      child: CircleAvatar(
                        backgroundColor: Kallcolors[index],
                        radius: 30,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
