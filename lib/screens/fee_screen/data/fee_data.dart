class FeeData {
  final String receiptNo;
  final String month;
  final String date;
  final String paymentStatus;
  final String totalAmount;
  final String btnStatus;

  FeeData(this.receiptNo, this.month, this.date, this.paymentStatus,
      this.totalAmount, this.btnStatus);
}

List<FeeData> fee = [
  FeeData('90871', 'November', '8 Nov 2023', 'Pending', '9000\₹', 'PAY NOW'),
  FeeData('90870', 'September', '8 Sep 2022', 'Paid', '10000\₹', 'DOWNLOAD'),
  FeeData('908869', 'August', '8 Aug 2021', 'Paid', '90000\₹', 'DOWNLOAD'),
];
