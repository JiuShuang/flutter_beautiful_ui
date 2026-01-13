import 'dart:ui';

class Invoice {
  final String id;
  final String avatar;
  final String name;
  final String email;
  final String date;
  final InvoiceStatus status;
  final bool isStar;

  Invoice({
    required this.id,
    required this.avatar,
    required this.name,
    required this.email,
    required this.date,
    required this.status,
    required this.isStar,
  });
}

enum InvoiceStatus {
  complete("Complete", Color(0xffEBF5ED), Color(0xff3A974C)),
  pending("Pending", Color(0xffFCF2E9), Color(0xffF2933A)),
  cancel("Cancel", Color(0xffFAE8EA), Color(0xffD11A2A));

  final String label;
  final Color backgroundColor;
  final Color textColor;
  const InvoiceStatus(this.label, this.backgroundColor, this.textColor);
}
