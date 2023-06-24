class AssignmentData {
  final String subjectName;
  final String topicName;
  final String assignDate;
  final String lastDate;
  final String status;

  AssignmentData(this.subjectName, this.topicName, this.assignDate,
      this.lastDate, this.status);
}

List<AssignmentData> assignment = [
  AssignmentData('Cloud', 'A W S', '17 Nov 2021', '22 Nov 2021', 'Pending'),
  AssignmentData(
      'DBMS', 'Network System', '11 Nov 2022', '20 Nov 2022', 'Submitted'),
  AssignmentData(
      'SE', 'Waterfall Model', '21 Oct 2022', '27 Oct 2022', 'Not Submitted'),
  AssignmentData('SCM', 'Logistics', '17 Sep 2022', '30 Sep 2022', 'Pending'),
];
