import 'package:hive_flutter/adapters.dart';

class TodoDataBase{
  List todos=[] ;
final _my_box = Hive.box('hey');  
void createInialData(){
  todos=[
    ['To dos  : swip <= to delete', false],
 ];
}

void loadData(){
  todos =_my_box.get('ToDoList');
  
}
void updateDatabase(){
  _my_box.put("ToDoList", todos);
}
}