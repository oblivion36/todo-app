import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_event.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_state.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_event.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_state.dart';
import 'package:dms/modules/add_note_screen/presentation/pages/add_note_screen.dart';
import 'package:dms/modules/add_note_screen/presentation/views/add_note.dart';
import 'package:dms/utils/common_widget/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class DetailsView extends StatelessWidget {
  String? taskTitle;
  String? date;
  String? time;
  String? status;
  String? description;
  String? uId;
  DetailsView(
      {super.key,
      this.taskTitle,
      this.date,
      this.time,
      this.status,
      this.uId,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuDrawer(),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          title: Center(
            child: Text(
              'Task Detail',
              style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, '/homeScreen');
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
          ),
          leadingWidth: 65,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFBEFC9)),
                  child: const Center(
                    child: Icon(Icons.favorite),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => DetailViewDeleteBloc(),
            ),
            BlocProvider(
              create: (context) => AddNoteBloc(),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                taskTitle ?? "Hello",
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Color.fromARGB(255, 233, 30, 99),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              date ??
                                  DateFormat('dd/MM/yyyy')
                                      .format(DateTime.now()),
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/details_view/clock_loader_90_24dp_FILL0_wght400_GRAD0_opsz24.svg',
                              height: 24,
                              width: 24,
                              color: const Color.fromARGB(255, 233, 30, 99),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Status : ${status ?? "Inprogress"}",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // IconButton(
                            //   icon: SvgPicture.asset(
                            //     'assets/images/details_view/clock_loader_90_24dp_FILL0_wght400_GRAD0_opsz24.svg',
                            //     height: 24,
                            //     width: 24,
                            //     color: Colors.grey.shade300,
                            //   ),
                            //   onPressed: () {},
                            // ),
                            const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 233, 30, 99),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              time ??
                                  DateFormat('HH:mm a').format(DateTime.now()),
                              style: GoogleFonts.raleway(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Call the share function when the user taps on the share icon
                                Share.share(
                                    'Check out this cool content!'); // Replace with your content
                              },
                              child: const Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 233, 30, 99),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Call the share function when the user taps on the share text
                                Share.share(
                                    'Check out this cool content!'); // Replace with your content
                              },
                              child: Text(
                                "Share",
                                style: GoogleFonts.raleway(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Text(
                "Description",
                style: GoogleFonts.raleway(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Text(
                description ?? "",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const Gap(30),
              Row(
                children: [
                  Visibility(
                      visible: true,
                      child: Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _formKey.currentState!.save();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddNoteScreen(
                                  uid: uId,
                                  titleController:
                                      TextEditingController(text: taskTitle),
                                  dateController:
                                      TextEditingController(text: date),
                                  descriptionController:
                                      TextEditingController(text: description),
                                  timeController:
                                      TextEditingController(text: time),
                                ),
                              ),
                            );

                            // BlocProvider.of<AddNoteBloc>(context).add(
                            //     AddNoteEditInitialEvent(uId ?? ""));
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  vertical:
                                      16.0), // Adjust the vertical padding to increase height
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide.none),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.yellow.shade100),
                          ),
                          child: const Text(
                            "Edit",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  BlocBuilder<DetailViewDeleteBloc, DetailViewState>(
                    builder: (context, state) {
                      return Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _formKey.currentState!.save();

                            //   if (_selectedItem == null) {
                            //     BlocProvider.of<ToDoBloc>(context)
                            //         .add(ToDoPostInitialEvent());
                            //   } else {
                            //     BlocProvider.of<ToDoBloc>(context).add(
                            //         ToDoDeleteInitialEvent(
                            //             _selectedItem?.id ?? ""));

                            //     setState(() {
                            //       _selectedItem = null;
                            //     });
                            //   }
                            // }
                            BlocProvider.of<DetailViewDeleteBloc>(context)
                                .add(DetailViewDeleteInitialEvent(uId ?? ""));
                            Navigator.pushNamed(context, '/listScreen');
                          },
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  vertical:
                                      16.0), // Adjust the vertical padding to increase height
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide.none),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                //     _selectedItem == null
                                //         ? Colors.grey
                                // :
                                Colors.red.shade200),
                          ),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
