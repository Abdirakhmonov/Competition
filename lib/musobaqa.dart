import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Competetion extends StatefulWidget {
  const Competetion({Key? key}) : super(key: key);

  @override
  State<Competetion> createState() => _CompetetionState();
}

class _CompetetionState extends State<Competetion> {
  Color selectedColor = Colors.black;
  TextEditingController expenseNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mening hamyonim"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: TextField(
                              controller: expenseNameController,
                              decoration: InputDecoration(
                                hintText: "Name of expense",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            child: TextField(
                              controller: priceController,
                              decoration: InputDecoration(
                                hintText: "Price of product",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              final pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              }
                            },
                            child: Text(
                              selectedDate != null
                                  ? "Selected Date: ${selectedDate!.toLocal().toString().split(' ')[0]}"
                                  : "Select Date",
                            ),
                          ),
                          ColorPicker(
                            colorPickerWidth: 100,
                            pickerColor: selectedColor,
                            onColorChanged: (Color color) {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            pickerAreaHeightPercent: 0.8,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              void saveInformation() {
                                String expenseName = expenseNameController.text;
                                String priceOfProduct = priceController.text;
                                print('Expense Name: $expenseName');
                                print('Price of Product: $priceOfProduct');
                                print('Selected Date: $selectedDate');
                                print('Selected Color: $selectedColor');
                                Navigator.of(context).pop();
                              }

                              saveInformation();
                            },
                            child: Text("SAVE ALL"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}


