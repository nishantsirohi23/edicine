import 'dart:io';

import 'package:edicine/models/postreport.dart';
import 'package:edicine/models/postuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();

}
class _AddMedicineScreenState extends State<AddMedicineScreen> {

  List<bool> _selections = List.generate(6, (_)=>false );
  List<bool> _selections1 = List.generate(6, (_)=>false );
  List<bool> _selections2 = List.generate(4, (_)=>false );
  late String _dropDownValue;




  var colour = 'pink';
  var compartment = 1;
  var type = 'tablet';
  final FirebaseAuth auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final startdateController = TextEditingController();
  final enddateController = TextEditingController();
  final colorController = TextEditingController();
  final typeController = TextEditingController();
  final quantityController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final doseController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    colorController.dispose();
    typeController.dispose();
    quantityController.dispose();
    startController.dispose();
    endController.dispose();
    doseController.dispose();

    super.dispose();
  }
  void inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    // here you write the codes to input the data into firestore
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new medicine"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(left: 5,top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: TextField(
                  controller:nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'medicine name',
                  ),
                ),
              ),
              SizedBox(height: 8,),

              ToggleButtons(
                children: <Widget>[
                  Container(child: Text("1",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),
                  Container(child: Text("2",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),
                  Container(child: Text("3",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),
                  Container(child: Text("4",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),
                  Container(child: Text("5",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),
                  Container(child: Text("6",style: TextStyle(color: Colors.black),),
                    margin: EdgeInsets.only(left: 5,right: 5),),





                ],
                isSelected:_selections,
                onPressed:(int index){
                  setState(() {
                    for (int i = 0; i < _selections.length; i++) {
                      _selections[i] = i == index;
                    }


                    if(index==0 && _selections[index]){
                      compartment = 1;
                    }
                    else if(index==0 && !_selections[index]){
                      compartment = 1;
                    }

                    if(index==1 && _selections[index]){
                      compartment = 2;
                    }
                    else if(index==1 && !_selections[index]){
                      compartment = 1;
                    }
                    if(index==2 && _selections[index]){
                      compartment = 3;
                    }
                    else if(index==2 && !_selections[index]){
                      compartment = 1;
                    }
                    if(index==3 && _selections[index]){
                      compartment = 4;
                    }
                    else if(index==3 && !_selections[index]){
                      compartment = 1;
                    }
                    if(index==4 && _selections[index]){
                      compartment = 5;
                    }
                    else if(index==4 && !_selections[index]){
                      compartment = 1;
                    }
                    if(index==5 && _selections[index]){
                      compartment = 6;
                    }
                    else if(index==5 && !_selections[index]){
                      compartment = 1;
                    }



                  });
                },
                color:Colors.teal,
                fillColor:Colors.blueAccent,
              ),
              SizedBox(height: 8,),
              ToggleButtons(
                renderBorder: false,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                    height: 50,
                    width: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    height: 50,
                    width: 50,
                  ),





                ],
                isSelected:_selections1,
                onPressed:(int index){
                  setState(() {
                    for (int i = 0; i < _selections1.length; i++) {
                      _selections1[i] = i == index;
                    }


                    if(index==0 && _selections1[index]){
                      colour = 'blue';
                    }
                    else if(index==0 && !_selections1[index]){
                      colour = "white";
                    }

                    if(index==1 && _selections1[index]){
                      colour = 'green';
                    }
                    else if(index==1 && !_selections1[index]){
                      colour = "white";
                    }
                    if(index==2 && _selections1[index]){
                      colour = 'grey';
                    }
                    else if(index==2 && !_selections1[index]){
                      colour = "white";
                    }
                    if(index==3 && _selections1[index]){
                      colour = 'orange';
                    }
                    else if(index==3 && !_selections1[index]){
                      colour = "white";
                    }
                    if(index==4 && _selections1[index]){
                      colour = 'purple';
                    }
                    else if(index==4 && !_selections1[index]){
                      colour = "white";
                    }
                    if(index==5 && _selections1[index]){
                      colour = 'yellow';
                    }
                    else if(index==5 && !_selections1[index]){
                      colour = "white";
                    }



                  });
                },
                color:Colors.teal,
                splashColor: Colors.grey.withOpacity(0.12),
                hoverColor: Color(0xFF6200EE).withOpacity(0.04),
              ),
              SizedBox(height: 8,),
              ToggleButtons(
                renderBorder: false,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('assets/capsule.png',height: 50,width: 50,),
                        Text("Capsule",style: TextStyle(color: Colors.black.withOpacity(0.8)),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('assets/medicine.png',height: 50,width: 50,),
                        Text("Medicine",style: TextStyle(color: Colors.black.withOpacity(0.8)),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('assets/liquid.png',height: 50,width: 50,),
                        Text("Liquid",style: TextStyle(color: Colors.black.withOpacity(0.8)),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.asset('assets/cream.png',height: 50,width: 50,),
                        Text("Cream",style: TextStyle(color: Colors.black.withOpacity(0.8)),)
                      ],
                    ),
                  )
                     ],
                isSelected:_selections2,
                onPressed:(int index){
                  setState(() {
                    for (int i = 0; i < _selections2.length; i++) {
                      _selections2[i] = i == index;
                    }


                    if(index==0 && _selections2[index]){
                      colour = 'blue';
                    }
                    else if(index==0 && !_selections2[index]){
                      colour = "white";
                    }

                    if(index==1 && _selections2[index]){
                      colour = 'green';
                    }
                    else if(index==1 && !_selections2[index]){
                      colour = "white";
                    }
                    if(index==2 && _selections2[index]){
                      colour = 'grey';
                    }
                    else if(index==2 && !_selections2[index]){
                      colour = "white";
                    }
                    if(index==3 && _selections2[index]){
                      colour = 'orange';
                    }
                    else if(index==3 && !_selections2[index]){
                      colour = "white";
                    }




                  });
                },
                color:Colors.teal,
                splashColor: Colors.grey.withOpacity(0.12),
                hoverColor: Color(0xFF6200EE).withOpacity(0.04),
              ),
              SizedBox(height: 8,),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: TextField(
                    controller: startdateController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "Start Date"
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? pickedDate=await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if(pickedDate!=null){
                        int formattedDate=pickedDate.day.toInt();

                        setState(() {
                          startdateController.text=formattedDate.toString();
                        });
                      }else{
                        print("Not selected");
                      }
                    },
                  ))),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: TextField(
                    controller: enddateController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: "End Date"
                    ),
                    readOnly: true,
                    onTap: () async{
                      DateTime? pickedDate=await showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if(pickedDate!=null){
                        int formattedDate= pickedDate.day.toInt();

                        setState(() {
                          enddateController.text=formattedDate.toString();
                        });
                      }else{
                        print("Not selected");
                      }
                    },
                  ))),




              SizedBox(
                width: 250,
                child: TextField(
                  controller: colorController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'medicine colour',
                  ),
                ),
              ),

              SizedBox(
                width: 250,
                child: TextField(
                  controller: typeController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'medicine type',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: quantityController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'quantity',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: startController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'start date',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: endController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'end date',
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: doseController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'how many dose',
                  ),
                ),
              ),




              Container(
                child: IconButton(onPressed: (){
                  posttestuser(nameController.text,colour,type,quantityController.text,int.parse(startdateController.text),int.parse(enddateController.text),doseController.text,"yes","no","yes");
                  var duration = const Duration(milliseconds: 50);
                  sleep(duration);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget));
                  },splashColor: Colors.blue,
                  icon: Icon(Icons.arrow_forward_ios),color: Colors.black,),
                margin: EdgeInsets.only(bottom: 100),
              )
            ],
          ),
        ),
      ),
    );
  }
}
