


class TestReport {
  TestReport({required this.name,
    required this.date,
    required this.afternoon,
    required this.morning,
    required this.night

  });

  TestReport.fromJson(Map<String, Object?> json)
      : this(
    name: json['name'] as String,
    date: json['date'] as String,
    afternoon: json['afternoon'] as String,
    night: json['afternoon'] as String,
    morning: json['afternoon'] as String,



  );

  final String name;
  final String date;
  final String afternoon;
  final String morning;
  final String night;


  Map<String, Object?> toJson() {
    return {
      'name': name,
      'date': date,
      'afernoon': afternoon,
      'night': night,
      'morning': morning

    };
  }
}