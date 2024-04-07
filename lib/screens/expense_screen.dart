import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:spend_wise/components/bottom_nav.dart';
import 'package:spend_wise/components/add_screen_data.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:spend_wise/components/global_variable.dart';

class ExpenseScreen extends StatefulWidget {
  static String id = 'ExpenseScreen';

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Map<String, dynamic>> expensesData = [];
  TextEditingController _searchController = TextEditingController();

  void _deleteExpense(QueryDocumentSnapshot<Map<String, dynamic>> expense) {
    FirebaseFirestore.instance
        .collection('expense')
        .doc(expense.id)
        .delete()
        .then((value) {
      print('Expense deleted successfully!');
    }).catchError((error) {
      print('Error deleting expense: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Transactions'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by transaction name',
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('expense')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                List<Widget> expenseWidgets = [];
                if (snapshot.hasData) {
                  final expenseList = snapshot.data?.docs.reversed.toList();
                  for (var expense in expenseList!) {
                    DateTime? selectedDate =
                        (expense['selectedDate'] as Timestamp?)?.toDate();

                    String? transactionName = expense['transactionName'];
                    String formattedDate = selectedDate != null
                        ? DateFormat.yMMMEd().format(selectedDate)
                        : 'Date Not Available';

                    Map<String, dynamic> motiveInfo = motive.firstWhere(
                      (element) => element['name'] == (expense['motive'] ?? ''),
                      orElse: () =>
                          {'icon': Icons.error, 'color': Colors.black},
                    );

                    if (_searchController.text.isEmpty ||
                        (transactionName != null &&
                            transactionName.toLowerCase().contains(
                                _searchController.text.toLowerCase()))) {
                      final expenseWidget = GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "Delete Transaction",
                            desc: "Do you want to delete this transaction.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => Navigator.pop(context),
                                color: Colors.blue,
                              ),
                              DialogButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  _deleteExpense(expense);
                                  Navigator.pop(context);
                                },
                                color: Colors.red,
                              )
                            ],
                          ).show();
                        },
                        child: ExpenseHistory(motiveInfo, transactionName,
                            expense, formattedDate),
                      );
                      expenseWidgets.add(expenseWidget);
                    }
                  }
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: expenseWidgets.length,
                    itemBuilder: (context, index) {
                      return expenseWidgets[index];
                    },
                  ),
                );
              },
            ),
            BottomNav(),
          ],
        ),
      ),
    );
  }

  Padding ExpenseHistory(
      Map<String, dynamic> motiveInfo,
      String? transactionName,
      QueryDocumentSnapshot<Map<String, dynamic>> expense,
      String formattedDate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: motiveInfo['color'],
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Icon(
              motiveInfo['icon'],
              size: 20.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transactionName ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "${expense['mode']}",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-₹${expense['expenseAmount'].toString()}",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
              Text(
                formattedDate,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
