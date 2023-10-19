import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app3/cubits/add_note_cubit1/add_note_cubit.dart';
import 'package:tasks_app3/cubits/notes_item_cubit2/notes_item_dart_cubit.dart';
import 'package:tasks_app3/helpers/custom_choosecolor.dart';
import 'package:tasks_app3/helpers/custom_elevatedbutton.dart';
import 'package:tasks_app3/helpers/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tasks_app3/models/noteemodel.dart';

class modalsheet extends StatefulWidget {
  const modalsheet({super.key});

  @override
  State<modalsheet> createState() => _modalsheetState();
}

class _modalsheetState extends State<modalsheet> {
  final GlobalKey<FormState> globalllkey = GlobalKey();
  AutovalidateMode auto = AutovalidateMode.disabled;

  String? title;
  String? suptitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is SucceededNote) {
            Navigator.pop(context);
          }
          if (state is FailuredNote) {
            print("${state.errmMssage} , failed");
          }
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: auto,
            key: globalllkey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ModalProgressHUD(
                inAsyncCall: state is LoadingNote ? true : false,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 16,
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(
                      children: [
                        textfield1(
                          hint1: "Title",
                          onsaved: (value) {
                            title = value ;
                          },
                        ),
                        textfield1(
                          hint1: "content",
                          mxline: 5,
                          textpaddingvertical: 50,
                          onsaved: (value) {
                            suptitle = value;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        SizedBox(
                          height:30*2,
                          child:
                            choosecolor()
                        ),                     
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        button(
                          name: "Add Note",
                          onpressed: () {
                            if (globalllkey.currentState!.validate()) {
                              globalllkey.currentState!.save();
                              var mynotewilladd = notemodel(
                                  address: title!,
                                  description: suptitle!,
                                  history:"${DateTime.now().year.toString()} - ${DateTime.now().month.toString()} - ${DateTime.now().day.toString()}" ,
                                  color: BlocProvider.of<AddNoteCubit>(context).notecolor ?? Color(0xFFFF6978).value);
                              BlocProvider.of<AddNoteCubit>(context).addnote(mynotewilladd);
                              BlocProvider.of<NotesItemDartCubit>(context).showmynoted() ;
                            } else {
                              setState(() {
                                auto = AutovalidateMode.always;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
