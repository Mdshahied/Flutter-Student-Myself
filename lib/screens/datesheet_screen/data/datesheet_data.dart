class DataSheet {
  final int date;
  final String monthName;
  final String subjectName;
  final String dayName;
  final String time;

  DataSheet(
      this.date, this.monthName, this.subjectName, this.dayName, this.time);
}

List<DataSheet> dateSheet = [
  DataSheet(01, 'JAN', 'NEW YEAR', 'Sunday', '12:00am'),
  DataSheet(24, 'APR', 'Ramadan', 'Friday', '12:00am'),
  DataSheet(29, 'JUN', 'Eid al-Adha', 'Thursday', '12:00am'),
  DataSheet(14, 'NOV', 'Diwali', 'Tuesday', '12:00am'),
  DataSheet(25, 'DEC', 'Christmas', 'Monday', '12:00am'),
  DataSheet(15, 'JAN', 'Pongal', 'Sunday', '12:00am'),
];
