import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Budjet extends StatefulWidget {
  const Budjet({super.key});

  @override
  State<Budjet> createState() => _BudjetState();
}

class _BudjetState extends State<Budjet> {

  TextEditingController newbudjet = TextEditingController();
  double budjet = 100000;

  @override
  Widget build(BuildContext context) {

    double screenwidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Oylik budjet: ",
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context)
                                      .viewInsets
                                      .bottom +
                                      30),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: newbudjet,
                                      decoration: const InputDecoration(
                                          hintText:
                                          "Yangi budjetingizni kiriting...",
                                          hintStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            newbudjet.clear();
                                          },
                                          child: const Text("Bekor qilish"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              budjet = double.tryParse(
                                                  newbudjet.text)!;
                                            });
                                            newbudjet.clear();
                                          },
                                          child: const Text("Saqlash"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  "$budjet",
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
              const Spacer(),
              Text("4.9%"),
            ],
          ),
          Stack(
            children: [ Container(
              height: 3,
              width: screenwidth,
              color: Colors.grey,
            ),
              Container(
                height: 4,
                width: 30.sp,
                color: Colors.blue,
              ),
            ]
          ),
        ],
      ),
    );
  }
}

