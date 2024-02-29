import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getxhive/controller/crudcontroller.dart';

import 'crud.dart';


class list extends StatelessWidget {
  list({super.key});
  final NoteController controller = Get.put(NoteController());



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
          title: Text("List"),backgroundColor: Colors.blue.shade200
    ),
      body: Obx(

            ()=> ListView.builder(
          itemCount:controller.notes.length,
            itemBuilder: (context, index){
            var item=controller.notes[index];
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(decoration: BoxDecoration(color: Colors.blue.shade200,borderRadius: BorderRadius.circular(20)),
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(title:Text(item.name) ,subtitle: Text(item.addres),
                        trailing: SizedBox(
                          width: 70,
                          child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                          InkWell(onTap: () {
                            Get.to(crud(note: item,));
                          },child: Icon(Icons.edit,color: Colors.grey,)),
                          InkWell(onTap: () {
                            controller.DeleteNote(item.id);

                          },child: Icon(Icons.delete,color: Colors.red,))
                      ],
                    ),
                        ),),),
            );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

        Get.to(crud());

      },child: Icon(Icons.add),),

    );
  }
}
