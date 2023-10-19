import 'package:hive/hive.dart';

part 'noteemodel.g.dart';

@HiveType(typeId: 0)
class notemodel extends HiveObject{
  @HiveField(0)
   String address ;
  @HiveField(1)
   String description ;
  @HiveField(2) 
   String history ;
  @HiveField(3)
   int color ; 

  notemodel({required this.address , required this.description ,required this.history , required this.color}) ;

}