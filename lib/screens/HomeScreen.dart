import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:edicine/server/medicinelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();



}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedValue = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi harry!"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20,top: 10,right: 20),
          child: Column(
            children: [
              Text("medicines of yours",style: TextStyle(color: CupertinoColors.black),),

              MedicineList(date: _selectedValue,)
            ],
          ),

        ),
      ),
    );
  }
}
