import 'package:expt/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecordItem extends StatefulWidget {
  const RecordItem({
    super.key,
    required this.categoryName,
    required this.date,
    required this.amount,
    required this.isExpense,
  });

  final String categoryName;
  final DateTime date;
  final double amount;
  final bool isExpense;

  @override
  State<StatefulWidget> createState() {
    return _RecordItemState();
  }
}

class _RecordItemState extends State<RecordItem> {
  final format = DateFormat.yMMMd('id');
  final NumberFormat rupiahFormat =
      NumberFormat.simpleCurrency(locale: 'id_ID');

  @override
  Widget build(BuildContext context) {
    final String categoryName = widget.categoryName;
    final String date = format.format(widget.date);
    final String amount = rupiahFormat.format(widget.amount);
    final bool isExpense = widget.isExpense;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .85, color: Colors.grey.shade300),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(21, 17.5, 21, 21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: textColor,
                ),
                categoryName,
              ),
              Text(
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: textSecondaryColor,
                ),
                date,
              ),
            ],
          ),
          Text(
            style: GoogleFonts.kameron(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.5,
                color: isExpense ? secondaryColor : dangerColor,
              ),
            ),
            amount.toString(),
          ),
        ],
      ),
    );
  }
}
