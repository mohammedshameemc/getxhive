import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxhive/controller/crudcontroller.dart';
import 'package:getxhive/list.dart';

import 'model.dart';


class crud extends StatelessWidget {
  final listmodels? note;

  crud({super.key,this.note});
   final NoteController controller = Get.put(NoteController());
  final TextEditingController namecontroller=TextEditingController();
  final TextEditingController addresscontroller=TextEditingController();



  @override
  Widget build(BuildContext context) {
    if (note!=null){
      namecontroller.text=note!.name;
      addresscontroller.text=note!.addres;
    }
    return  Scaffold(backgroundColor: Colors.blue.shade200,
      body:

      Column(
          children: [
            SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(note!=null?"update":"Add", style: TextStyle(fontSize: 30, fontFamily: "font")),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: TextFormField(
                              controller:
                              namecontroller,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  border: InputBorder.none,
                                  labelText: "NAME",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "font")))),
                    ])),

            SizedBox(height: 50,),

            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: TextFormField(
                controller: addresscontroller,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        border: InputBorder.none,
                        labelText: "ADDRESS",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "font")))),
            SizedBox(
              height: 20,
            ),
            TextButton(onPressed: (){
              if(note!=null){
                controller.UpdateNote(note!.id,namecontroller.text, addresscontroller.text);

              }else{
                controller.addNote(namecontroller.text, addresscontroller.text);

              }

              Get.back();

            }, child: Text(note!=null?"Update":"Add"))
          ]),

    );
  }
}
