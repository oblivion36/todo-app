import 'package:dms/modules/list_screen/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:gap/gap.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFFBEFC9)),
            child: const Center(
              child: Icon(Icons.arrow_back),
            ),
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFFFBEFC9)),
              child: const Center(
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text("Add Task"),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xFFFBEFC9)),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {},
                activeColor: const Color(0xFFFDD868),
                dayProps: const EasyDayProps(
                  todayHighlightStyle: TodayHighlightStyle.none,
                  todayHighlightColor: Color(0xFFFBEFC9),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      TaskCard(
                        title: '@isaias_cuula',
                        description: 'Follow me on My Social Media',
                        time: '12:08 PM',
                        status: 'To-Do',
                        cardColor: Colors.red.shade100,
                      ),
                      const SizedBox(
                          height: 16.0), // Adjust the height as needed
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
