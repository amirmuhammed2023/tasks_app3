import 'package:flutter/material.dart';

class iconappbar extends StatelessWidget {
  const iconappbar({required this.iconpage, required this.onPressed});
  final Icon iconpage ; 
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.only(right: 12, top:10 , bottom:4 ),
            child: Container(
              height: MediaQuery.of(context).size.height*0.12,
              width: MediaQuery.of(context).size.width*0.12,
              decoration:BoxDecoration(
                color:Colors.grey.withOpacity(0.15),
                borderRadius:BorderRadius.circular(12),
              ),
              child: IconButton(
                onPressed:onPressed, 
                icon: iconpage,
                ),
            ),
          );
  }
}