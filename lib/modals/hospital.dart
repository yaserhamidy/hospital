

class Hospital {
  final String name;
  final DateTime time;
  final String imagePath;
  late final bool isChecked;
  final String doctorName;
  final String Price;
  final String info;

  Hospital({
    required this.Price,
    required this.doctorName,
    required this.name,
    required this.info,
    required this.time,
    required this.imagePath,
    this.isChecked = false,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      Price: json['Price'],
      doctorName: json['doctorName'],
      name: json['name'],
      info: json['info'],
      time: DateTime.parse(json['time']),
      imagePath: json['imagePath'],
      isChecked: json['isChecked'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Price': Price,
      'doctorName': doctorName,
      'name': name,
      'info': info,
      'time': time.toIso8601String(),
      'imagePath': imagePath,
      'isChecked': isChecked,
    };
  }
}