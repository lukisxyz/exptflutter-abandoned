import 'package:expt/utils/color_scheme.dart';
import 'package:expt/widgets/record_item.dart';
import 'package:flutter/material.dart';

class RecordLists extends StatefulWidget {
  const RecordLists({super.key, required this.expenseData});

  final List<Map<String, dynamic>> expenseData;

  @override
  State<StatefulWidget> createState() {
    return _RecordListsState();
  }
}

class _RecordListsState extends State<RecordLists> {
  _onUndoDeletion() {
    print("Undoing deletion");
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.expenseData;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .85, color: Colors.grey.shade300),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          data.isEmpty
              ? const Text("No Records Found")
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(16),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 3),
                            content: const Text("record was deleted",
                                style: TextStyle(color: Colors.white)),
                            action: SnackBarAction(
                              onPressed: _onUndoDeletion,
                              label: "UNDO",
                            ),
                          ),
                        );
                      },
                      key: Key(data[index]["id"].toString()),
                      child: RecordItem(
                        categoryName: data[index]["categoryName"],
                        date: data[index]["date"],
                        amount: data[index]["amount"],
                        isExpense: data[index]["isExpense"],
                      ),
                    );
                  },
                ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
            ),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Load more"),
                SizedBox(width: 7),
                Icon(Icons.arrow_right_alt_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
