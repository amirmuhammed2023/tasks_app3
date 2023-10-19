import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app3/cubits/notes_item_cubit2/notes_item_dart_cubit.dart';
import 'package:tasks_app3/models/noteemodel.dart';
import 'package:tasks_app3/pages/edit_page.dart';

class itemnote extends StatelessWidget {
  const itemnote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesItemDartCubit, NotesItemDartState>(
      builder: (context, state) {
        List<notemodel> instanceofnotes =
            BlocProvider.of<NotesItemDartCubit>(context).mynotes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: ListView.builder(
            itemCount: instanceofnotes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return editnote(
                        notesedit: instanceofnotes[index], 
                      );
                    },
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(instanceofnotes[index].color),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text(
                              instanceofnotes[index].address,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text(
                                instanceofnotes[index].description,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  instanceofnotes[index].delete();
                                  BlocProvider.of<NotesItemDartCubit>(context)
                                      .showmynoted();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                  size: 30,
                                )),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8, right: 16),
                            child: Text(
                              instanceofnotes[index].history,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
