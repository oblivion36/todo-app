import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsView extends StatelessWidget {
  String? taskTitle;
  String? date;
  String? time;
  String? status;
  String? description;
  DetailsView(
      {super.key,
      this.taskTitle,
      this.date,
      this.time,
      this.status,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scaffold(
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
              leading: GestureDetector(
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
              // leadingWidth: 65,
              actions: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFBEFC9)),
                  child: const Center(
                    child: Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          flex: 5,
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
                                    color:
                                        const Color.fromARGB(255, 233, 30, 99),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Status : ${status ?? "inprogress"}",
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
                                        DateFormat('HH:mm a')
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(
                                    Icons.share,
                                    color: Color.fromARGB(255, 233, 30, 99),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Share",
                                    style: GoogleFonts.raleway(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              )
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

                                //   BlocProvider.of<ToDoBloc>(context).add(
                                //       ToDoEditInitialEvent(
                                //           _selectedItem?.id ?? ""));

                                //   setState(() {
                                //     _selectedItem = null;
                                //   });
                                // }
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
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
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.yellow.shade100),
                              ),
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
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
                              // _selectedItem == null ? "Submit" :
                              "Delete",

                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )));
  }
}
