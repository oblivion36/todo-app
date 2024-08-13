import 'package:dms/modules/Dashboard/presentation/bloc/home_screen_bloc.dart';
import 'package:dms/modules/Dashboard/presentation/bloc/home_screen_event.dart';
import 'package:dms/modules/Dashboard/presentation/bloc/home_screen_state.dart';
import 'package:dms/modules/Dashboard/presentation/widgets/custom_card_widget.dart';
<<<<<<< Updated upstream
=======
import 'package:dms/modules/Dashboard/presentation/widgets/profile_details.dart';
import 'package:dms/modules/add_note_screen/presentation/views/details_view.dart';
import 'package:dms/modules/list_screen/domain/entities/list_screen_etitites_model.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_bloc.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_event.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_state.dart';
import 'package:dms/modules/list_screen/presentation/widgets/task_card.dart';
import 'package:dms/utils/common_widget/empty_widget.dart';
import 'package:dms/utils/common_widget/failed_widget.dart';
import 'package:dms/utils/common_widget/loading_widget.dart';
import 'package:dms/utils/common_widget/menu_drawer.dart';
import 'package:flutter/gestures.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ListScreenAttributeModel? listScreenAttributeModel;
  BuildContext? context;

  HomeScreen({super.key, this.context});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
        appBar: AppBar(
=======
        key: _scaffoldKey,
        drawer: MenuDrawer(),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          surfaceTintColor: Colors.transparent,
>>>>>>> Stashed changes
          title: Center(
            child: Text(
              'Todo App',
              style: GoogleFonts.raleway(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
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
                    _scaffoldKey.currentState!.openDrawer(); // Open the drawer
                  },
                ),
              ),
            ),
          ),
          leadingWidth: 65,
          actions: [
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  final overlay = Overlay.of(context);
                  final renderBox = context.findRenderObject() as RenderBox;
                  final size = renderBox.size;
                  final offset = renderBox.localToGlobal(Offset.zero);

                  OverlayEntry entry = OverlayEntry(
                    builder: (context) => Positioned(
                      top: offset.dy + size.height,
                      left: offset.dx - size.width * 3,
                      child: CustomTooltip(
                        name: 'Saurabh Sonar',
                        email: 'saurabhsonar@example.com',
                      ),
                    ),
                  );

                  overlay.insert(entry);

                  // Automatically remove the tooltip after a delay
                  Future.delayed(Duration(seconds: 3), () {
                    entry.remove();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0xFFFBEFC9),
                    ),
                    child: const Center(
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => HomeScreenBloc(),
            ),
            BlocProvider(
              create: (context) => ListScreenBloc()
                ..add(DateTasksEvent(
                    selectedDate:
                        DateFormat('yyyy-MM-dd').format(DateTime.now()))),
            ),
          ],
          child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Good Afternoon, Bersyte!',
                      style: GoogleFonts.raleway(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
<<<<<<< Updated upstream
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    // BlocProvider.of<ToDoBloc>(context)
                    //     .add(SearchTasksEvent());
                  },
                  // controller: BlocProvider.of<ToDoBloc>(context)
                  //     .searchTextController,
                  decoration: InputDecoration(
                    hintText: 'Search a task...',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomCard(
                    color: Colors.red,
                    icon: Icons.assignment,
                    name: "To-Do",
                    bordercolor: Colors.red,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomCard(
                    color: Colors.yellow,
                    icon: Icons.assignment_late,
                    name: "Progress",
                    bordercolor: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomCard(
                    color: Colors.green,
                    icon: Icons.assignment_turned_in,
                    name: "Done",
                    bordercolor: Colors.green,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Today's Tasks",
                  style: GoogleFonts.merriweather(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "See All",
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ]),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 233, 168),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Text(
                          "You don't have task\n for today!",
                          textAlign: TextAlign.center,
                          // maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          "Click Here to Create One",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
=======
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "You don't have tasks for this month yet! ",
                        style: GoogleFonts.merriweather(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Create One',
                            style: GoogleFonts.merriweather(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/addNote');
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextFormField(
                        onChanged: (value) {
                          BlocProvider.of<ListScreenBloc>(context)
                              .add(SearchTasksEvent());
                        },
                        controller: BlocProvider.of<ListScreenBloc>(context)
                            .searchTextController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Search a task...',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Visibility(
                      visible:
                          BlocProvider.of<HomeScreenBloc>(context).isSeeAll,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/taskToDOScreen',
                                      arguments: 'To-Do',
                                    );
                                  },
                                  child: CustomCard(
                                    color: Colors.red,
                                    icon: Icons.assignment,
                                    name: "To-Do",
                                    bordercolor: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/taskToDOScreen',
                                      arguments: 'Progress',
                                    );
                                  },
                                  child: CustomCard(
                                    color: const Color(0xFFFDD868),
                                    icon: Icons.assignment_late,
                                    name: "Progress",
                                    bordercolor: const Color(0xFFFDD868),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/taskToDOScreen',
                                      arguments: 'Done',
                                    );
                                  },
                                  child: CustomCard(
                                    color: Colors.green,
                                    icon: Icons.assignment_turned_in,
                                    name: "Done",
                                    bordercolor: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Tasks",
                            style: GoogleFonts.merriweather(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<HomeScreenBloc>(context)
                                  .add(HomeScreenSeeAllEvent());
                            },
                            child: Text(
                              BlocProvider.of<HomeScreenBloc>(context).isSeeAll
                                  ? "See All"
                                  : "See Less",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<ListScreenBloc, ListScreenState>(
                      builder: (context, state) {
                        if (state is DateTaskSlotSuccessState) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: BlocProvider.of<ListScreenBloc>(
                                          context,
                                          listen: false)
                                      .searchedTaskSlots
                                      .isEmpty
                                  ? state.dateTaskSlots?.length
                                  : BlocProvider.of<ListScreenBloc>(context,
                                          listen: false)
                                      .searchedTaskSlots
                                      .length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailsView(
                                              taskTitle: state
                                                      .dateTaskSlots?[index]
                                                      .title ??
                                                  "",
                                              date: state.dateTaskSlots?[index]
                                                          .createdAt !=
                                                      null
                                                  ? DateFormat('dd/MM/yyyy')
                                                      .format(state
                                                              .dateTaskSlots?[
                                                                  index]
                                                              .createdAt ??
                                                          DateTime.now())
                                                  : "",
                                              time: state.dateTaskSlots?[index]
                                                          .createdAt !=
                                                      null
                                                  ? DateFormat('hh:mm a')
                                                      .format(state
                                                              .dateTaskSlots?[
                                                                  index]
                                                              .createdAt ??
                                                          DateTime.now())
                                                  : "",
                                              status:
                                                  'To-Do', // Assuming status is a fixed value
                                              description: state
                                                      .dateTaskSlots?[index]
                                                      .description ??
                                                  "",
                                              uId: state
                                                  .dateTaskSlots?[index].id,
                                            ),
                                          ),
                                        );
                                      },
                                      child: TaskCard(
                                        title: BlocProvider.of<ListScreenBloc>(
                                                    context,
                                                    listen: false)
                                                .searchedTaskSlots
                                                .isEmpty
                                            ? (state.dateTaskSlots?[index]
                                                    .title ??
                                                "")
                                            : BlocProvider.of<ListScreenBloc>(
                                                    context,
                                                    listen: false)
                                                .searchedTaskSlots[index]
                                                .title,
                                        description: BlocProvider.of<
                                                        ListScreenBloc>(context,
                                                    listen: false)
                                                .searchedTaskSlots
                                                .isEmpty
                                            ? (state.dateTaskSlots?[index]
                                                    .description ??
                                                "")
                                            : BlocProvider.of<ListScreenBloc>(
                                                        context,
                                                        listen: false)
                                                    .searchedTaskSlots[index]
                                                    .description ??
                                                "",
                                        time: BlocProvider.of<ListScreenBloc>(
                                                    context,
                                                    listen: false)
                                                .searchedTaskSlots
                                                .isEmpty
                                            ? (state.dateTaskSlots?[index].createdAt !=
                                                    null
                                                ? DateFormat('hh:mm a').format(state
                                                        .dateTaskSlots?[index]
                                                        .createdAt ??
                                                    DateTime.now())
                                                : "")
                                            : (BlocProvider.of<ListScreenBloc>(
                                                            context,
                                                            listen: false)
                                                        .searchedTaskSlots[index]
                                                        .createdAt !=
                                                    null
                                                ? DateFormat('hh:mm a').format(state.dateTaskSlots?[index].createdAt ?? DateTime.now())
                                                : ""),
                                        status: 'To-Do',
                                        cardColor: Colors.red.shade100,
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            16.0), // Adjust the height as needed
                                  ],
                                );
                              },
                            ),
                          );
                        } else if (state is ListScreenEmptystate) {
                          return Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/addNote');
                              },
                              child: Container(
                                width: double.infinity,
                                // height: double.infinity,
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 233, 168),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "You don't have task\n for today!",
                                      textAlign: TextAlign.center,
                                      // maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Click Here to Create One",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else if (state is ListScreenFailState) {
                          return Center(
                              child: FailureWidget(
                            height: (BlocProvider.of<HomeScreenBloc>(context)
                                    .isSeeAll
                                ? 140
                                : 350),
                          ));
                        } else if (state is SearchTaskEmptystate) {
                          return Center(
                              child: EmptyWidget(
                            height: (BlocProvider.of<HomeScreenBloc>(context)
                                    .isSeeAll
                                ? 140
                                : 350),
                          ));
                        } else if (state is ListScreenLoadState) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount:
                                  listScreenAttributeModel?.items?.length,
                              itemBuilder: (context, index) {
                                return const Column(
                                  children: [
                                    LoadingWidget(
                                      width: double.infinity,
                                      height: 150,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                    ),
                                    SizedBox(height: 16.0),
                                  ],
                                );
                              },
                            ),
                          );
                        } else if (state is ListScreenSuccessState) {
                          return Expanded(
                            child: ListView.builder(
                              itemCount:
                                  listScreenAttributeModel?.items?.length,
                              itemBuilder: (context, index) {
                                return const Column(
                                  children: [
                                    LoadingWidget(
                                      width: double.infinity,
                                      height: 150,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                    ),
                                    SizedBox(height: 16.0),
                                  ],
                                );
                              },
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: listScreenAttributeModel?.items?.length,
                            itemBuilder: (context, index) {
                              return const Column(
                                children: [
                                  LoadingWidget(
                                    width: double.infinity,
                                    height: 150,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                  ),
                                  SizedBox(
                                      height:
                                          16.0), // Adjust the height as needed
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
>>>>>>> Stashed changes
          ),
        ));
  }
}
