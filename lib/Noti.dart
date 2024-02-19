import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:solomay/chat/chat_main.dart';

class EventDetails {
  final String eventId;
  final String name;
  final String date;
  // Add other properties as per your document structure

  EventDetails({
    required this.eventId,
    required this.name,
    required this.date,
    // Initialize other properties as per your document structure
  });
}

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  List<EventDetails> eventList = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final eventsSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc('3i60L7Q6kYNYCKotPIq9YNX27333') // Replace with the actual user ID
        .collection('events')
        .get();

    final eventDetailsList = <EventDetails>[];

    for (final eventDoc in eventsSnapshot.docs) {
      final eventString = eventDoc.data()['eventString'] as String;

      final oldCollectionSnapshot = await FirebaseFirestore.instance
          .collection('Events')
          .doc(eventString)
          .get();

      if (oldCollectionSnapshot.exists) {
        final eventDetails = EventDetails(
          eventId: oldCollectionSnapshot.id,
          name: oldCollectionSnapshot.data()!['name'] as String,
          date: oldCollectionSnapshot.data()!['date'] as String,
          // Set other properties as per your document structure
        );
        eventDetailsList.add(eventDetails);
      }
    }

    setState(() {
      eventList = eventDetailsList;
    });
  }
  @override
  Widget build(BuildContext context) {
    double mqHeight = MediaQuery.of(context).size.height;
    double mqWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: mqHeight * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(35),bottomLeft: Radius.circular(35)),
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFFe0927f),
                      const Color(0xFF42afbe),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(

                children: [
                  Container(
                    margin: EdgeInsets.only(top: mqHeight * 0.07,left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios,color: Colors.white,),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.tableCellsLarge,color: Colors.white,),
                            SizedBox(
                              width: 15,
                            ),
                            Icon(FontAwesomeIcons.search,color: Colors.white,),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(FontAwesomeIcons.add,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: Colors.black,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {

                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mqHeight * 0.02,
            ),
            Container(
              padding: EdgeInsets.only(left: 15,right: 15),
              height: mqHeight * 0.11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(mqHeight * 0.11)),
                gradient: LinearGradient(
                    colors: [
                      const Color(0xFFc94db0),
                      const Color(0xFFe0927f),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/starch.png",height: 40,width: 40,),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Here your AI-based\ntime optimization tips!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,),
                ],
              ),
            ),
            SizedBox(
              height: mqHeight * 0.02,
            ),
            Container(
              height: mqHeight * 0.60,
              width: mqWidth,
              decoration: BoxDecoration(
                color: const Color(0xFFeae5e1),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35)),
              ),
              child: Column(
                children: [
                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 40,
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      thickness: 4.8,
                    ),
                  ),


                ],
              ),
            )
          ],
        )
    );
  }
}



