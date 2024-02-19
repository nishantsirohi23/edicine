


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool _visible = false;
bool mvisible = false;
bool avisible = false;
bool nvisible = false;
String _condition = "left";
String _medtype = "";
final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = user?.uid;
var _selectedValue = 14;
var _selectedValue1 = 20;
String _imagepath = "";
String _medoimagepath = "";

class MedicineList extends StatefulWidget {
  final int date;
  const MedicineList({Key? key,required this.date}) : super(key: key);
  

  @override
  _MedicineListState createState() => _MedicineListState(this.date);
}


void reload() async {


  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').snapshots();




}


class _MedicineListState extends State<MedicineList> {
  late int date;
  _MedicineListState(this.date);


  @override
  Widget build(BuildContext context) {

    double mqHeight = MediaQuery.of(context).size.height;
    double mqWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.black,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            // New date selected
            setState(() {
              _selectedValue = date.day;
              _selectedValue1 = date.day;
              reload();
            });
          },
        ),

        Visibility(
          child: Container(
            margin: EdgeInsets.only(left: 8,top:10,bottom: 10),
            child: Text("Morning 08:00am",style: TextStyle(color: Colors.black,fontSize: 25),),
          ),
          visible: mvisible,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').where('morning',isEqualTo: 'yes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            //if(snapshot.data?.size == 0){
            //  mvisible = false;
            //}
            //else{
            //  mvisible = true;
            //}

            return ListView(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                if(data['condition']=='left'){
                  _imagepath = 'assets/bellgey.png';
                }
                else if(data['condition']=='missed'){
                  _imagepath = 'assets/bellred.png';
                }
                else if(data['condition']=='taken'){
                  _imagepath = 'assets/belgreen.png';
                }
                else{
                  _imagepath = 'assets/bellyellow.png';
                }
                if(data['type']=='capsule'){
                  _medoimagepath = 'assets/capsule.png';
                }
                else if(data['type']=='cream'){
                  _medoimagepath = 'assets/cream.png';
                }
                else if(data['type']=='liquid'){
                  _medoimagepath = 'assets/liquid.png';
                }
                else{
                  _medoimagepath = 'assets/medicine.png';
                }

                if (data['start'] <=_selectedValue && data['end'] >=_selectedValue){
                  return GestureDetector(
                      child: Container(
                          width: mqWidth-30,
                          height: 100,
                          margin: const EdgeInsets.only(left: 8,bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xFFf4f4fc)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(left: 10),
                                child: Image.asset(_medoimagepath),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['name'],style: TextStyle(color: CupertinoColors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Before Breakfast",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 19,),
                                        Text("Day 1",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(8.5),
                                  child: Column(
                                    children: [
                                      Image.asset(_imagepath),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                      onTap: () {

                      }

                  );

                }

                return Visibility(child: Text("asd"),visible: false,);


              }).toList(),
            );

          },
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("Afternoon 02:00pm",style: TextStyle(color: Colors.black,fontSize: 25),),
          ),
          visible: avisible,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').where('afernoon',isEqualTo: 'yes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            if(snapshot.data?.size == 0){
              mvisible = false;
            }
            else{
              mvisible = true;
            }

            return ListView(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                if(data['condition']=='left'){
                  _imagepath = 'assets/bellgey.png';
                }
                else if(data['condition']=='missed'){
                  _imagepath = 'assets/bellred.png';
                }
                else if(data['condition']=='taken'){
                  _imagepath = 'assets/belgreen.png';
                }
                else{
                  _imagepath = 'assets/bellyellow.png';
                }
                if(data['type']=='capsule'){
                  _medoimagepath = 'assets/capsule.png';
                }
                else if(data['type']=='cream'){
                  _medoimagepath = 'assets/cream.png';
                }
                else if(data['type']=='liquid'){
                  _medoimagepath = 'assets/liquid.png';
                }
                else{
                  _medoimagepath = 'assets/medicine.png';

                }

                if (data['start'] <=_selectedValue && data['end'] >=_selectedValue){
                  avisible = true;
                  return GestureDetector(
                      child: Container(
                          width: mqWidth-30,
                          height: 100,
                          margin: const EdgeInsets.only(left: 8,bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xFFf4f4fc)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(left: 10),
                                child: Image.asset(_medoimagepath),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['name'],style: TextStyle(color: CupertinoColors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Before Breakfast",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 19,),
                                        Text("Day 1",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(8.5),
                                  child: Column(
                                    children: [
                                      Image.asset(_imagepath),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                      onTap: () {

                      }

                  );

                }

                return Visibility(child: Text("asd"),visible: false,);

                


              }).toList(),
            );

          },
        ),
        Visibility(
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("Night 09:00pm",style: TextStyle(color: Colors.black,fontSize: 25),),
          ),
          visible: nvisible,
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').where('night',isEqualTo: 'yes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }


            return ListView(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                if(data['condition']=='left'){
                  _imagepath = 'assets/bellgey.png';
                }
                else if(data['condition']=='missed'){
                  _imagepath = 'assets/bellred.png';
                }
                else if(data['condition']=='taken'){
                  _imagepath = 'assets/belgreen.png';
                }
                else{
                  _imagepath = 'assets/bellyellow.png';
                }
                if(data['type']=='capsule'){
                  _medoimagepath = 'assets/capsule.png';
                }
                else if(data['type']=='cream'){
                  _medoimagepath = 'assets/cream.png';
                }
                else if(data['type']=='liquid'){
                  _medoimagepath = 'assets/liquid.png';
                }
                else{
                  _medoimagepath = 'assets/medicine.png';
                }

                if (data['start'] <=_selectedValue && data['end'] >=_selectedValue){
                  nvisible = true;
                  return GestureDetector(
                      child: Container(
                          width: mqWidth-30,
                          height: 100,
                          margin: const EdgeInsets.only(left: 8,bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Color(0xFFf4f4fc)

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(left: 10),
                                child: Image.asset(_medoimagepath),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data['name'],style: TextStyle(color: CupertinoColors.black,fontSize: 20,fontWeight: FontWeight.w400),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Before Breakfast",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 19,),
                                        Text("Day 1",style: TextStyle(
                                          color: CupertinoColors.black,
                                          fontSize: 15,
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(8.5),
                                  child: Column(
                                    children: [
                                      Image.asset(_imagepath),
                                    ],
                                  )
                              )
                            ],
                          )
                      ),
                      onTap: () {

                      }

                  );

                }

                return Visibility(child: Text("asd"),visible: false,);


              }).toList(),
            );

          },
        ),
      ],
    );
  }
}







