import 'package:flutter/material.dart';
import 'package:tasks_app3/helpers/mycolors.dart';

class button extends StatelessWidget {
  const button({required this.name,  this.onpressed});
  final String name ;
  final void Function()? onpressed ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
              onPressed: onpressed, 
              child: Text(name,style: TextStyle(color:Colors.black,fontSize: 16,fontWeight:FontWeight.w700),),
              style : ElevatedButton.styleFrom(
                backgroundColor: kprimarycolor ,
                padding:EdgeInsets.symmetric(vertical: 14 , horizontal: 140) 
                )
              );
  }
}