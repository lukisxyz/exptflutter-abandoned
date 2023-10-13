import 'package:expt/data/seeder.dart';
import 'package:expt/utils/color_scheme.dart';
import 'package:expt/widgets/record_list.dart';
import 'package:expt/widgets/summary_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  final _currentIndex = 0;
  final _data = expenseData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SummaryCard(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: .85, color: Colors.grey.shade300),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(21, 28, 21, 0),
              child: const Text(
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: textColor,
                  ),
                  "Recent Records"),
            ),
            RecordLists(expenseData: _data),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: "Records",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: "Categories",
          ),
        ],
      ),
    );
  }
}
