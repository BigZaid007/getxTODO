class todoList
{


  String title;
  bool value;


  todoList({this.title,this.value});



  Map<String,dynamic> todoMap()

  {
    return
        {
          "title":this.title,
          "value":this.value,
        };
  }


}