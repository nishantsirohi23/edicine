import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Report",style: TextStyle(color: CupertinoColors.black),),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              height: mq.height/5.8,
              width: mq.width-20,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                  //color: const Color(0xFF66BB6A),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0, // soften the shadow
                  spreadRadius: 0.1, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Text("Today's Report",style: TextStyle(color: CupertinoColors.black,fontSize: 19,fontWeight: FontWeight.w400),),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("5",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 24),),
                          Text("Total",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 24),)
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
