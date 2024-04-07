import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/adding_buttons.dart';
import '../components/extra_feature_buttons.dart';
import '../components/number_button.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spend_wise/components/add_screen_data.dart';

class AddScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddExpense;
  AddScreen({required this.onAddExpense});

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _expenseController = TextEditingController();
  TextEditingController _transactionNameContrtoller = TextEditingController();

  FocusNode _textFieldFocusNode = FocusNode();
  List<String> enteredNumbers = [];
  DateTime? _selectedDate;

  late String _selected = '0';
  late String _selectedMotive = '0';
  double totalExpense = 0;

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // void _storeData() {
  //   String mode = _selected;
  //   String motive = _selectedMotive;
  //   String expenseAmount = _expenseController.text;
  //   DateTime selectedDate = _selectedDate ?? DateTime.now();
  //
  //   // Perform actions with the collected data
  //   print("Mode: $mode");
  //   print("Motive: $motive");
  //   print("Expense Amount: $expenseAmount");
  //   print("Selected Date: $selectedDate");
  //
  //   _expenseController.clear();
  //
  //   widget.onAddExpense({
  //     'mode': mode,
  //     'motive': motive,
  //     'expenseAmount': expenseAmount,
  //     'selectedDate': selectedDate,
  //   });
  //
  //   // Update total expense
  //   setState(() {
  //     totalExpense += double.parse(expenseAmount);
  //     print("Total Expense: $totalExpense");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      hint: Text("Select Mode"),
                      value: _selected,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selected = newValue!;
                        });
                        print(_selected);
                      },
                      items: mode.map((Map<String, dynamic> map) {
                        return DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          child: Row(
                            children: <Widget>[
                              Icon(map["icon"]),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(map["name"]),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isDense: true,
                      hint: Text("Select Motive"),
                      value: _selectedMotive,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedMotive = newValue!;
                        });
                        print(_selectedMotive);
                      },
                      items: motive.map((Map<String, dynamic> map) {
                        return DropdownMenuItem<String>(
                          value: map["id"].toString(),
                          child: Row(
                            children: <Widget>[
                              Icon(map["icon"]),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(map["name"]),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Text(
              'Expenses',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '₹',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                ),
              ),
              SizedBox(width: 20.0),
              SizedBox(
                child: TextField(
                  controller: _expenseController,
                  focusNode: _textFieldFocusNode,
                  readOnly: true,
                  showCursor: true,
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
                width: 150.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 20.0),
            child: SizedBox(
              child: TextField(
                controller: _transactionNameContrtoller,
                decoration: InputDecoration(
                  hintText: 'Transaction Name...',
                  border: InputBorder.none,
                ),
              ),
              width: 150.0,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: NumberButton(
                    text: '1',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('1');
                        _expenseController.text +=
                            '1'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '2',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('2');
                        _expenseController.text +=
                            '2'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '3',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('3');
                        _expenseController.text +=
                            '3'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: ExtraFeatureButtons(
                    color: Color(0xFFFFE0D6),
                    icon: Icons.backspace_outlined,
                    iconColor: Colors.black,
                    onPressed: () {
                      if (enteredNumbers.isNotEmpty) {
                        setState(() {
                          enteredNumbers.removeLast();
                          _expenseController.text = enteredNumbers.join();
                          _textFieldFocusNode.requestFocus();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: NumberButton(
                    text: '4',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('4');
                        _expenseController.text +=
                            '4'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '5',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('5');
                        _expenseController.text +=
                            '5'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '6',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('6');
                        _expenseController.text +=
                            '6'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: ExtraFeatureButtons(
                    color: Color(0xFFE0ECFF),
                    icon: Icons.calendar_month_outlined,
                    iconColor: Colors.black,
                    onPressed: () {
                      _showDatePicker();
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: NumberButton(
                    text: '7',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('7');
                        _expenseController.text +=
                            '7'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '8',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('8');
                        _expenseController.text +=
                            '8'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '9',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('9');
                        _expenseController.text +=
                            '9'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: ExtraFeatureButtons(
                    color: Color(0xFFFFF7D8),
                    icon: Icons.currency_rupee_outlined,
                    iconColor: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: NumberButton(
                    text: '0',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('0');
                        _expenseController.text +=
                            '0'; // Concatenate the new digit
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: NumberButton(
                    text: '.',
                    onPressed: () {
                      setState(() {
                        enteredNumbers.add('.');
                        _expenseController.text = enteredNumbers.join();
                        _textFieldFocusNode.requestFocus();
                      });
                    },
                    controller: _expenseController,
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: ExtraFeatureButtons(
                    color: Color(0xFF1E1D2E),
                    icon: Icons.check,
                    iconColor: Colors.white,
                    onPressed: () async {
                      // Add the expense to Firestore
                      CollectionReference collRef =
                          FirebaseFirestore.instance.collection('expense');
                      await collRef.add({
                        'motive': motive.firstWhere((element) =>
                            element['id'].toString() ==
                            _selectedMotive)['name'],
                        'mode': mode.firstWhere((element) =>
                            element['id'].toString() == _selected)['name'],
                        'expenseAmount':
                            double.tryParse(_expenseController.text) ?? 0,
                        'selectedDate': _selectedDate,
                        'transactionName': _transactionNameContrtoller.text,
                        'timestamp': FieldValue.serverTimestamp(),
                      });

                      // Update total expense
                      setState(() {
                        totalExpense +=
                            double.tryParse(_expenseController.text) ?? 0;
                        print('Total Expense: $totalExpense');
                      });

                      // Clear text controllers
                      _expenseController.clear();
                      _transactionNameContrtoller.clear();
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
