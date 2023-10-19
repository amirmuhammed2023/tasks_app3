import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app3/cubits/add_note_cubit1/add_note_cubit.dart';
import 'package:tasks_app3/helpers/mycolors.dart';

class choosecolor extends StatelessWidget {
  choosecolor({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Kallcolors.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<AddNoteCubit>(context).notecolor =
                  Kallcolors[index].value;
            },
            child: CircleAvatar(
              backgroundColor: Kallcolors[index],
              radius: 30,
            ),
          ),
        );
      },
    );
  }
}
