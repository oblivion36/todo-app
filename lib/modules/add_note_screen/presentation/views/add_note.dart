import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

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
                        Text("Save Task"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task title",
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    TextField(
                      // controller: _taskTitleController,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color(0xFFFBEFC9),
                            )),
                        // labelText: 'Task title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.yellow.shade200),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                                TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                          color: Color(0xFFFBEFC9),
                                        )),
                                    // labelText: 'Date',
                                    // hintText: DateFormat.yMd().format(_selectedDate),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.calendar_today),
                                      color: Colors.grey.shade300,
                                      onPressed: () {},
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFBEFC9)),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Expanded(

                                Text(
                                  "Time",
                                  style: GoogleFonts.raleway(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),

                                TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    // labelText: 'Time',

                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                        borderSide: BorderSide(
                                          color: Color(0xFFFBEFC9),
                                        )),

                                    // hintText: _selectedTime.format(context),
                                    suffixIcon: IconButton(
                                        icon: const Icon(Icons.access_time),
                                        color: Colors.grey.shade300,
                                        onPressed: () => {}),

                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFBEFC9)),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Description",
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(
                              color: Color(0xFFFBEFC9),
                            )),
                        // labelText: 'Description...',
                        labelStyle: const TextStyle(),
                        // hintText: _selectedTime.format(context),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelStyle: TextStyle(),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.yellow.shade200),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Color",
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pink,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.cyan,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lime,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 50, // give any height you need
                            width: 50, // give the same as height,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown,
                              border: Border.all(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                  ]),
            )));
  }
}
