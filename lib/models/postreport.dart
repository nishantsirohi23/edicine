import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edicine/models/testreport.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final uid = user?.uid;
DateTime today = DateTime.now();
String dateStr = today.toString().substring(0, 10);



final reportref = FirebaseFirestore.instance.collection('users').doc(uid).collection('medicines').withConverter<TestReport>(
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