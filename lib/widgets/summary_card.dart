import 'package:expt/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SummaryCard extends StatefulWidget {
  const SummaryCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SummaryCardState();
  }
}

class _SummaryCardState extends State<SummaryCard> {
  final NumberFormat rupiahFormat =
      NumberFormat.simpleCurrency(locale: 'id_ID');
  @override
  Widget build(BuildContext context) {
    final balance = rupiahFormat.format(12000000);
    final expense = rupiahFormat.format(1000000);
    return Container(
      decoration: const BoxDecoration(
        color: primaryColor,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                const Text(
                  "Balance",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: backgroundColor,
                  ),
                ),
                Text(
                  balance,
                  style: GoogleFonts.kameron(
                    textStyle: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(21, 7, 21, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Expense",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500,
                    color: backgroundColor,
                  ),
                ),
                const SizedBox(height: 3.5),
                Text(
                  expense,
                  style: GoogleFonts.kameron(
                    textStyle: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.w600,
                      color: backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
