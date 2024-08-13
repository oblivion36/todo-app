import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_event.dart';

import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_state.dart';
import 'package:dms/modules/add_note_screen/presentation/widgets/color_container_widget.dart';
import 'package:dms/services/database.dart';
import 'package:dms/utils/common_widget/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class AddTaskPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> addnote = GlobalKey();

  final TextEditingController? titleEditController;
  final TextEditingController? dateEditController;
  final TextEditingController? timeEditController;
  final TextEditingController? descriptionEditController;
  String? uid;
  Color? selectedColor;

  AddTaskPage(
      {super.key,
      required this.uid,
      this.titleEditController,
      this.dateEditController,
      this.timeEditController,
      this.descriptionEditController,
      this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: addnote,
      drawer: MenuDrawer(),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 5),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFFBEFC9)),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  addnote.currentState!.openDrawer(); // Open the drawer
                },
              ),
            ),
          ),
        ),
        leadingWidth: 65,
        actions: [
          GestureDetector(
            onTap: () async {
              // String id = randomAlphaNumeric(10);
              // Map<String, dynamic> taskInfoMap = {
              //   "id": id,
              //   "title": BlocProvider.of<AddNoteBloc>(context).titleController,
              //   "date": BlocProvider.of<AddNoteBloc>(context).dateController,
              //   "time": BlocProvider.of<AddNoteBloc>(context).timeController,
              //   "description":
              //       BlocProvider.of<AddNoteBloc>(context).descriptionController,
              // };
              // await DatabaseMethod().addTask(taskInfoMap, id).then((onValue) {
              //   Fluttertoast.showToast(
              //       msg: "Task Added Successfully",
              //       toastLength: Toast.LENGTH_SHORT,
              //       gravity: ToastGravity.CENTER,
              //       timeInSecForIosWeb: 1,
              //       backgroundColor: Colors.red,
              //       textColor: Colors.white,
              //       fontSize: 16.0);
              // });

              if (uid == null || uid?.isEmpty == true || uid == "") {
                BlocProvider.of<AddNoteBloc>(context)
                    .add(AddNotePostInitialEvent());
              } else {
                BlocProvider.of<AddNoteBloc>(context).add(
                    AddNoteEditInitialEvent(
                        uid: uid,
                        dateController: dateEditController,
                        descriptionController: descriptionEditController,
                        timeController: timeEditController,
                        titleController: titleEditController,
                        isCompleted: false));
              }
              Navigator.pushNamed(context, '/listScreen');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5, right: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFFBEFC9)),
                child: Center(
                  child: Row(
                    children: [
                      Text((uid == null || uid?.isEmpty == true || uid == "")
                          ? "Save Task"
                          : "Edit Task"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<AddNoteBloc, AddNoteState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Task title",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              TextField(
                controller: (uid == null || uid?.isEmpty == true || uid == "")
                    ? BlocProvider.of<AddNoteBloc>(context).titleController
                    : titleEditController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.amber)),
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
                            onTap: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2026).add(
                                  const Duration(days: 365),
                                ),
                                builder:
                                    (BuildContext context, Widget? child) =>
                                        Theme(
                                  data: ThemeData.light().copyWith(
                                    primaryColor: Colors.blue,
                                    hintColor: Colors.blue,
                                    colorScheme: const ColorScheme.light(
                                      primary: Colors.blue,
                                    ),
                                  ),
                                  child: child!,
                                ),
                              );
                              if (selectedDate != null) {
                                (uid == null ||
                                        uid?.isEmpty == true ||
                                        uid == "")
                                    ? BlocProvider.of<AddNoteBloc>(context)
                                            .dateController
                                            .text =
                                        DateFormat('yyyy-MM-dd')
                                            .format(selectedDate)
                                    : dateEditController;
                              }
                            },
                            onChanged: (value) {},
                            readOnly: true,
                            controller: (uid == null ||
                                    uid?.isEmpty == true ||
                                    uid == "")
                                ? BlocProvider.of<AddNoteBloc>(context)
                                    .dateController
                                : dateEditController,
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(
                                    color: Color(0xFFFBEFC9),
                                  )),
                              // labelText: 'Date',
                              // hintText: DateFormat.yMd().format(_selectedDate),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                color: Colors.grey.shade300,
                                onPressed: () async {},
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    const BorderSide(color: Color(0xFFFBEFC9)),
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
                            onTap: () async {
                              final TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: false),
                                      child: child!,
                                    );
                                  });
                              if (picked != null) {
                                final String formattedTime =
                                    '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
                                (uid == null ||
                                        uid?.isEmpty == true ||
                                        uid == "")
                                    ? BlocProvider.of<AddNoteBloc>(context)
                                        .timeController
                                        .text = formattedTime
                                    : timeEditController;
                              }
                            },
                            controller: (uid == null ||
                                    uid?.isEmpty == true ||
                                    uid == "")
                                ? BlocProvider.of<AddNoteBloc>(context)
                                    .timeController
                                : timeEditController,
                            readOnly: true,
                            decoration: InputDecoration(
                              // labelText: 'Time',
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  borderSide: BorderSide(color: Colors.amber)),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
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
                                borderSide:
                                    const BorderSide(color: Color(0xFFFBEFC9)),
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
                controller: (uid == null || uid?.isEmpty == true || uid == "")
                    ? BlocProvider.of<AddNoteBloc>(context)
                        .descriptionController
                    : descriptionEditController,
                maxLines: 6,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.amber)),
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
                    ColorContainer(
                      color: Colors.black,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.black),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.red,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.red),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.yellow,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.yellow),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.blue,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.blue),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.pink,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.pink),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.purple,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.purple),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.orange,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.orange),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.cyan,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.cyan),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.lime,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.lime),
                        );
                      },
                    ),
                    ColorContainer(
                      color: Colors.brown,
                      onTap: () {
                        BlocProvider.of<AddNoteBloc>(context).add(
                          AddNoteColorSelectedEvent(Colors.brown),
                        );
                      },
                    ),
                  ],
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
