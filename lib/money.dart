import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> money = [
    {
      'money': '4,560,000',
      'date': '2024-01-01',
    },
    {
      'money': '7,880,000',
      'date': '2024-02-01',
    },
    {
      'money': '6,990,000',
      'date': '2024-03-01',
    },
    {
      'money': '14,275,000',
      'date': '2024-04-01',
    },
    {
      'money': '6,015,000',
      'date': '2024-05-01',
    },
  ];

  String rightNowTime = DateTime.now().toString();
  int moneyIndex = 0;
  String moneyMain = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 500.h,
      width: double.infinity,
      child: Column(
        children: [
          /// text button for main date
          TextButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime(2023),
                lastDate: DateTime(2025),
              );
              setState(() {
                rightNowTime = dateFormatter(date.toString());
                money.forEach(
                  (element) {
                    if (element['date'] == dateFormatter(rightNowTime)) {
                      moneyMain = element['money'];
                    }
                  },
                );
              });
            },
            child: Text(
              dateFormatter(rightNowTime),
              style: TextStyle(fontSize: 20.sp),
            ),
          ),

          /// main money shower
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),

                /// first icon button
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (moneyIndex >= 1) {
                        moneyIndex -= 1;
                        rightNowTime = money[moneyIndex]['date'];
                        moneyMain = money[moneyIndex]['money'];
                      }
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded),
                ),
              ),

              /// text for money shower
              Text(
                checker(rightNowTime)
                    ? '$moneyMain so\'m'
                    : 'Sizda ushbu oyda\nharajat yo\'q',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                ),
              ),

              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),

                /// second icon button
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (moneyIndex < money.length - 1) {
                        moneyIndex += 1;
                        moneyMain = money[moneyIndex]['money'];
                        rightNowTime = money[moneyIndex]['date'];
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String dateFormatter(String date) {
    String box = date.split(' ')[0];
    return box;
  }

  bool checker(String date) {
    bool found = false;

    money.forEach((element) {
      if (element['date'] == date) {
        found = true;
      }
    });
    return found;
  }
}
