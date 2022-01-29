import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:newnote/controller/note_controller.dart';
import 'package:newnote/theme/theme_services.dart';
import 'package:newnote/widgets/alarm_dialog.dart';
import 'package:newnote/widgets/searchbar.dart';
import 'add_new_note_page.dart';
import 'note_detail_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(NoteController());


   emptyNotes()
  {

    return Container(
      child: controller.isNoteEmpty()?  Center(
          child: Text('Add Your First Note',style: TextStyle(
              fontSize: 20
          ),)
      ):CircularProgressIndicator(

      ),
    );



  }

final color =[
  Color(0xffFFFF66),
  Color(0xffFF6F61),
  Color(0xffcbdb57),
  Color(0xfff96a4b),
  Color(0xfffe9a37),
  Color(0xff9585ba),
  Color(0xff6F9FD8),
  Color(0xffFFFF66),
  Color(0xff3F69AA),
  Color(0xffFF6F61),
  Color(0xffcbdb57),
  Color(0xfff96a4b),
  Color(0xfffe9a37),
  Color(0xff9585ba),
  Color(0xff6F9FD8),
  Color(0xffFFFF66),
  Color(0xff3F69AA),
  Color(0xffFF6F61),
  Color(0xffcbdb57),
  Color(0xfff96a4b),
  Color(0xfffe9a37),
  Color(0xff9585ba),
  Color(0xff6F9FD8),
  Color(0xffFFFF66),
  Color(0xff9585ba),
  Color(0xff6F9FD8),
  Color(0xffFFFF66),
  Color(0xff3F69AA),
  Color(0xffFF6F61),
  Color(0xffcbdb57),
  Color(0xfff96a4b),
  Color(0xfffe9a37),
 ] ;







  Widget viewNotes() {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child:StaggeredGridView.countBuilder(
            itemCount: controller.notes.length,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 20.0,
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  //todo go to other page with index
                  Get.to(
                    NoteDetailPage(),
                    arguments: index,
                  );
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogWidget(
                        contentText: "Are you sure you want to delete the note?",
                        confirmFunction: () {
                          controller.deleteNote(controller.notes[index].id);
                          Get.back();
                        },
                        declineFunction: () {
                          Get.back();
                        },
                      );
                    },
                  );
                },
                child: isDark?Container(
                  decoration: BoxDecoration(
                    color: color[index],
                    //color: Colors.yellowAccent,

                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //todo add note(title) from index
                        controller.notes[index].title,
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        //todo add note(content) from index
                        controller.notes[index].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        maxLines: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        //todo add note(date time) from index
                        controller.notes[index].dateTimeEdited,style: TextStyle(
                          color: Colors.black
                      ),
                      ),
                    ],
                  ),
                ):Container(
                  decoration: BoxDecoration(
                    color:color[index],

                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //todo add note(title) from index
                        controller.notes[index].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        //todo add note(content) from index
                        controller.notes[index].content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        maxLines: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        //todo add note(date time) from index
                        controller.notes[index].dateTimeEdited,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

    );
  }

  bool isDark=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: InkWell(onTap:(){
          themeService().swtichTheme();
          setState(() {
            if(themeService().theme==ThemeMode.light)
              isDark=true;
            else
              isDark=false;
          });

            },
            child: Icon(isDark?(Icons.nightlight_round):(Icons.wb_sunny_outlined))),


        title: Text(
          "Home",
          style: TextStyle(

          ),
        ),
        //backgroundColor: Colors.white,
        centerTitle: true,

        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchBar());
            },
          ),
          PopupMenuButton(
            onSelected: (val) {
              if (val == 0) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogWidget(
                      contentText: "Are you sure you want to delete all notes?",
                      confirmFunction: () {
                        controller.deleteAllNotes();
                        Get.back();
                      },
                      declineFunction: () {
                        Get.back();
                      },
                    );
                  },
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  "Delete All Notes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: GetBuilder<NoteController> (
        builder: (_)  => controller.isNoteEmpty()?  emptyNotes(): viewNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(()=>AddNewNotePage());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}


