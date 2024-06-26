import 'package:dms/modules/list_screen/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTodoScreen extends StatelessWidget {
  const TaskTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: Center(
            child: Text(
              'Tasks To-Do',
              style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/homeScreen');
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFFBEFC9)),
              child: const Center(
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
          // leadingWidth: 65,
          actions: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFFBEFC9)),
              child: const Center(
                child: Icon(Icons.assignment),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Gap(30),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       color: const Color(0xFFFBEFC9)),
              //   child: EasyDateTimeLine(
              //     initialDate: DateTime.now(),
              //     onDateChange: (selectedDate) {},
              //     activeColor: const Color(0xFFFDD868),
              //     dayProps: const EasyDayProps(
              //       todayHighlightStyle: TodayHighlightStyle.none,
              //       todayHighlightColor: Color(0xFFFBEFC9),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/detailsView');
                          },
                          child: TaskCard(
                            title: '@isaias_cuula',
                            description: 'Follow me on My Social Media',
                            time: '12:08 PM',
                            status: 'To-Do',
                            cardColor: Colors.red.shade100,
                          ),
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
      ),
    );
  }
}
