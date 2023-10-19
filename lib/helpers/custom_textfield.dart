import 'package:flutter/material.dart';
import 'package:tasks_app3/helpers/mycolors.dart';

class textfield1 extends StatelessWidget {
  const textfield1({required this.hint1 , this.onChanged ,this.onsaved, this.mxline = 1, this.textpaddingvertical = 18});
  final String hint1 ;
  final int mxline ; 
  final double textpaddingvertical ; 
  final void Function(String?)?  onsaved ;
  final void Function(String)? onChanged ;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical:10),
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "this field is required" ;
                  } else {
                    return null ;
                  }
                },
                onChanged: onChanged,
                onSaved: onsaved,
                cursorColor:kprimarycolor,
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:textpaddingvertical,horizontal:16), 
                  hintStyle:TextStyle(color:kprimarycolor),
                  hintText:hint1,
                  hintMaxLines: mxline,
                  enabledBorder:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(8)
                  ),
                  errorBorder:OutlineInputBorder(
                    borderSide:BorderSide(color:Colors.red),
                    borderRadius:BorderRadius.circular(8)
                  ),
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color:kprimarycolor),
                    borderRadius:BorderRadius.circular(8)
                  ),
                ),
              ),
            );
  }
}