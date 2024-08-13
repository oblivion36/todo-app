import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/add_note_bloc/add_note_event.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_bloc.dart';
import 'package:dms/modules/add_note_screen/presentation/bloc/detail_view_bloc/detail_view_event.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

//apply filter for status
class TaskTodoScreen extends StatefulWidget {
  String? pageName;
  TaskTodoScreen({super.key, this.pageName});

  @override
  _TaskTodoScreenState createState() => _TaskTodoScreenState();
}

class _TaskTodoScreenState extends State<TaskTodoScreen> {
  final GlobalKey<ScaffoldState> taskTodoScreen = GlobalKey();
  ListScreenAttributeModel? listScreenAttributeModel;
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: taskTodoScreen,
      drawer: MenuDrawer(
        context: context,
      ),
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        title: Center(
          child: Text(
            'Tasks ${widget.pageName ?? ""}',
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
                  taskTodoScreen.currentState!.openDrawer(); // Open the drawer
                },
              ),
            ),
          ),
        ),
        leadingWidth: 65,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFFBEFC9)),
              child: const Center(
                child: Icon(Icons.assignment),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<ListScreenBloc, ListScreenState>(
          builder: (context, state) {
            print("currrent stateeeee : ${state}");
            if (state is DateTaskSlotSuccessState) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: state.statusFilter?.length ?? 0 + 1,
                itemBuilder: (context, index) {
                  if (index == state.listScreenAttributeModel?.items?.length) {
                    return const LoadingWidget(
                      width: double.infinity,
                      height: 150,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    );
                  }
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsView(
                                taskTitle:
                                    state.statusFilter?[index].title ?? "",
                                date: state.statusFilter?[index].createdAt !=
                                        null
                                    ? DateFormat('dd/MM/yyyy').format(
                                        state.statusFilter?[index].createdAt ??
                                            DateTime.now())
                                    : "",
                                time: state.statusFilter?[index].createdAt !=
                                        null
                                    ? DateFormat('hh:mm a').format(
                                        state.statusFilter?[index].createdAt ??
                                            DateTime.now())
                                    : "",
                                status: 'To-Do',
                                description:
                                    state.statusFilter?[index].description ??
                                        "",
                                uId: state
                                    .listScreenAttributeModel?.items?[index].id,
                              ),
                            ),
                          );
                        },
                        child: Dismissible(
                          key: Key(state
                                  .listScreenAttributeModel?.items?[index].id ??
                              ""),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              BlocProvider.of<AddNoteBloc>(context).add(
                                  AddNoteEditInitialEvent(
                                      uid: state.statusFilter?[index].id ?? "",
                                      dateController: TextEditingController(
                                          text:
                                              state.statusFilter?[index]
                                                  .createdAt
                                                  .toString()),
                                      descriptionController:
                                          TextEditingController(
                                              text: state.statusFilter?[index]
                                                  .description),
                                      timeController: TextEditingController(
                                          text: state
                                              .statusFilter?[index].createdAt
                                              .toString()),
                                      titleController: TextEditingController(
                                          text:
                                              state.statusFilter?[index].title),
                                      isCompleted: true));

                              BlocProvider.of<ListScreenBloc>(context)
                                ..add(StatusFilterEvent());
                            } else if (direction ==
                                DismissDirection.endToStart) {
                              var deletedItem = state.statusFilter?[index];

                              setState(() {
                                state.statusFilter?.removeAt(index);
                              });

                              bool isUndoTapped = false;

                              // Show SnackBar with Undo action
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      backgroundColor: const Color(0xFFFBEFC9),
                                      content: Text(
                                        "Task Deleted",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      action: SnackBarAction(
                                        label: "UNDO",
                                        textColor: Colors.black,
                                        onPressed: () {
                                          isUndoTapped = true;
                                          setState(() {
                                            state.statusFilter
                                                ?.insert(index, deletedItem!);
                                          });
                                        },
                                      ),
                                      duration: Duration(seconds: 3),
                                    ),
                                  )
                                  .closed
                                  .then((_) {
                                if (!isUndoTapped) {
                                  BlocProvider.of<DetailViewDeleteBloc>(context)
                                      .add(DetailViewDeleteInitialEvent(
                                          deletedItem?.id ?? ""));
                                }
                              });
                            }
                          },
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          background: Container(
                            color: Colors.green,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                          child: TaskCard(
                            title: state.statusFilter?[index].title ?? "",
                            description:
                                state.statusFilter?[index].description ?? "",
                            time: state.statusFilter?[index].createdAt != null
                                ? DateFormat('hh:mm a').format(
                                    state.statusFilter?[index].createdAt ??
                                        DateTime.now())
                                : "",
                            status:
                                state.statusFilter?[index].isCompleted == false
                                    ? widget.pageName
                                    : 'Done',
                            cardColor: Colors.red.shade100,
                          ),
                        ),
                      ),

                      const SizedBox(
                          height: 16.0), // Adjust the height as needed
                    ],
                  );
                },
              );
            } else if (state is ListScreenEmptystate) {
              return const EmptyWidget();
            } else if (state is ListScreenFailState) {
              return const FailureWidget();
            } else if (state is ListScreenLoadState) {
              return ListView.builder(
                controller: _scrollController,
                itemCount: 10,
                itemBuilder: (context, index) {
                  if (index == listScreenAttributeModel?.items?.length) {
                    return const LoadingWidget(
                      width: double.infinity,
                      height: 150,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    );
                  }
                  return const Column(
                    children: [
                      LoadingWidget(
                        width: double.infinity,
                        height: 150,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      SizedBox(height: 16.0), // Adjust the height as needed
                    ],
                  );
                },
              );
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: 20,
              itemBuilder: (context, index) {
                if (index == listScreenAttributeModel?.items?.length) {
                  return const LoadingWidget(
                    width: double.infinity,
                    height: 150,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  );
                }
                return const Column(
                  children: [
                    LoadingWidget(
                      width: double.infinity,
                      height: 150,
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    SizedBox(height: 16.0), // Adjust the height as needed
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  fetchData() {
    if (BlocProvider.of<ListScreenBloc>(context).morepage == true) {
      currentPage++;
      BlocProvider.of<ListScreenBloc>(context)
          .add(FetchMoreItemsEvent(count: currentPage));
    }
  }
}
