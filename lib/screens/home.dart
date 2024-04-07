import 'package:flutter/material.dart';
import 'package:spend_wise/components/bar_graph/bar_graph.dart';
import 'package:spend_wise/components/expenses/expenses_list.dart';
import 'package:spend_wise/components/expense_data.dart';
import 'package:spend_wise/components/top_switchable_button.dart';
import 'package:spend_wise/components/expense_stats_timewise.dart';
import 'package:spend_wise/screens/add_screen.dart';
import '../components/bottom_nav.dart';
import 'package:provider/provider.dart';
import '../components/limit_provider.dart';
import 'package:spend_wise/screens/expense_screen.dart';

import '../components/total_expense_provider.dart';

class Home extends StatefulWidget {
  static String id = 'HomePage';

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<String> enteredNumbers = [];
  int currentSliderValue = 0;
  TextEditingController sliderController = TextEditingController();

  int calculateRemainingLimit(int originalLimit, double totalExpenseAmount) {
    return originalLimit - totalExpenseAmount.toInt();
  }

  @override
  Widget build(BuildContext context) {
    int limit = Provider.of<LimitProvider>(context).limit;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 35.0,
                  ),
                  Column(
                    children: [
                      Text(
                        '₹$limit',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Total Limit - ₹$limit',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 35.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 55.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF1E1D2E),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                        ),
                        child: TopSwitchableButton(
                          height: 50.0,
                          width: 110.0,
                          text: 'Expenses',
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      TopSwitchableButton(
                        height: 50.0,
                        width: 90.0,
                        text: 'Add',
                        textColor: Colors.black,
                        onPressed: () {
                          print('Add button pressed');
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AddScreen(
                                onAddExpense:
                                    (Map<String, dynamic> expenseData) {
                                  print('Expense added: $expenseData');
                                },
                              );
                            },
                            isScrollControlled: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 55.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: SizedBox(
                    height: 50.0,
                    width: 90.0,
                    child: TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          'Set Limit',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 30.0,
                                      // ),
                                      SizedBox(
                                        child: TextField(
                                          controller: sliderController,
                                          cursorColor: Color(0xFF1E1D2E),
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30.0,
                                          ),
                                          onChanged: (text) {
                                            setState(() {
                                              currentSliderValue =
                                                  int.parse(text);
                                            });
                                          },
                                          decoration: InputDecoration(
                                            hintText: '0',
                                            hintStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 40.0,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                        width: 150.0,
                                      ),
                                      Slider(
                                        value: currentSliderValue.toDouble(),
                                        min: 0.0,
                                        max: 10000.0,
                                        activeColor: Color(0xFF1E1D2E),
                                        onChanged: (double newValue) {
                                          setState(() {
                                            currentSliderValue =
                                                newValue.round();
                                            sliderController.text =
                                                currentSliderValue.toString();
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Container(
                                        height: 40.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1E1D2E),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20.0),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Provider.of<LimitProvider>(context,
                                                    listen: false)
                                                .setLimit(currentSliderValue);
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            'Done',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Set Limit',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 250,
              child: MyBarGraph(
                weeklySummary: weeklySummary,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ExpenseStatsTimewise(
            //       text: 'Day',
            //       price: 52,
            //     ),
            //     ExpenseStatsTimewise(
            //       text: 'Week',
            //       price: 403,
            //     ),
            //     ExpenseStatsTimewise(
            //       text: 'Month',
            //       price: 1612,
            //     ),
            //   ],
            // ),
            Expanded(
                child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                return ExpensesList(
                  icon: expenses[index]['icon'],
                  expenseName: expenses[index]['category'],
                  expenseMode: expenses[index]['paymentMethod'],
                  amt: expenses[index]['amount'],
                  percentage: expenses[index]['percentage'],
                  color: expenses[index]['color'],
                );
              },
            )),
            BottomNav(),
          ],
        ),
      ),
    );
  }
}
