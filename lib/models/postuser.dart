
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edicine/models/testreport.dart';
import 'package:edicine/models/testuser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = user?.uid;
var docid = "";

final userref = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').withConverter<TestMedicine>(
  fromFirestore: (snapshot, _) => TestMedicine.fromJson(snapshot.data()!),
  toFirestore: (TestMedicine, _) => TestMedicine.toJson(),

);
Future<void> posttestuser(name,colour,type,quantity,start,end,dose,afternoon,night,morning) async {
  print(userref.id);
  docid =userref.id.toString();


  // Add a movie
  await userref.add(
    TestMedicine(
      name: name,
      colour: colour,
      type: type,
      quantity: quantity,
      start: start,
      end: end,
      dose: dose,
      afternoon: afternoon,
        night: night,
        morning: morning




    ),


  );
  for (var i = start;i<=end;i++){
    postreport(name,i.toString(),afternoon,night,morning);
  }






}


DateTime today = DateTime.now();
String dateStr = today.toString().substring(0, 10);



final reportref = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').doc(docid).collection('report').withConverter<TestReport>(
  fromFirestore: (snapshot, _) => TestReport.fromJson(snapshot.data()!),
  toFirestore: (TestReport, _) => TestReport.toJson(),
);
Future<void> postreport(name,date,afternoon,night,morning) async {


  // Add a movie
  await reportref.add(
    TestReport(
        name: name,
        date: date,
        afternoon: afternoon,
        night: night,
        morning: morning




    ),
  );




}