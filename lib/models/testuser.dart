

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class TestMedicine {
  TestMedicine({required this.name,
    required this.colour,
    required this.type,
    required this.quantity,
  required this.start,
    required this.end,
    required this.dose,
    required this.afternoon,
    required this.night,
    required this.morning,

  });

  TestMedicine.fromJson(Map<String, Object?> json)
      : this(
    name: json['name'] as String,
    colour: json['colour'] as String,
    type: json['type'] as String,
    quantity: json['quantity'] as String,
    start: json['start'] as int,
    end: json['end'] as int,
    dose: json['dose'] as String,
    afternoon: json['afternoon'] as String,
    night: json['afternoon'] as String,
    morning: json['afternoon'] as String,



  );

  final String name;
  final String colour;
  final String type;
  final String quantity;
  final int start;
  final int end;
  final String dose;
  final String afternoon;
  final String morning;
  final String night;


  Map<String, Object?> toJson() {
    return {
      'name': name,
      'colour': colour,
      'type': type,
      'quantity': quantity,
      'start': start,
      'end': end,
      'dose': dose,
      'afernoon': afternoon,
      'night': night,
      'morning': morning

    };
  }
}