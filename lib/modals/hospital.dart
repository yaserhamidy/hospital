
class Hospital {
  final String name;
  final DateTime time;
  final String imagePath;
  bool isChecked;
  final String doctorName;
  final String Price;
  final String info;

  Hospital(
      {required this.Price,
        required this.doctorName,
        required this.name,
        required this.info,
        required this.time,
        required this.imagePath,
        this.isChecked = false});
}
