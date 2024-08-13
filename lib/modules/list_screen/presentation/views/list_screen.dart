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
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  ListScreenAttributeModel? listScreenAttributeModel;
  final GlobalKey<ScaffoldState> listScreen = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: listScreen,
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
                    listScreen.currentState!.openDrawer(); // Open the drawer
                  },
                ),
              ),
            ),
          ),
          leadingWidth: 65,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/addNote');
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 5, right: 16),
                child: Container(
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
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ListScreenBloc, ListScreenState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xFFFBEFC9)),
                    child: EasyDateTimeLine(
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        final date =
                            DateFormat('yyyy-MM-dd').format(selectedDate);

                        BlocProvider.of<ListScreenBloc>(context)
                            .add(DateTasksEvent(selectedDate: date));
                      },
                      activeColor: const Color(0xFFFDD868),
                      dayProps: const EasyDayProps(
                        todayHighlightStyle: TodayHighlightStyle.none,
                        todayHighlightColor: Color(0xFFFBEFC9),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  if (state is ListScreenSuccessState)
                    Expanded(
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
                              SizedBox(height: 16.0),
                            ],
                          );
                        },
                      ),
                    ),
                  if (state is DateTaskSlotSuccessState)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.dateTaskSlots?.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsView(
                                        taskTitle:
                                            state.dateTaskSlots?[index].title ??
                                                "",
                                        date: (state.dateTaskSlots?[index]
                                                    .createdAt !=
                                                null
                                            ? DateFormat('dd/MM/yyyy').format(
                                                state.dateTaskSlots?[index]
                                                        .createdAt ??
                                                    DateTime.now())
                                            : ""),
                                        time: (state.dateTaskSlots?[index]
                                                    .createdAt !=
                                                null
                                            ? DateFormat('hh:mm a').format(state
                                                    .dateTaskSlots?[index]
                                                    .createdAt ??
                                                DateTime.now())
                                            : ""),
                                        status: 'To-Do',
                                        description: state.dateTaskSlots?[index]
                                                .description ??
                                            "",
                                        uId: state.listScreenAttributeModel
                                            ?.items?[index].id,
                                      ),
                                    ),
                                  );
                                },
                                child: TaskCard(
                                  title:
                                      state.dateTaskSlots?[index].title ?? "",
                                  description:
                                      state.dateTaskSlots?[index].description ??
                                          "",
                                  time:
                                      (state.dateTaskSlots?[index].createdAt !=
                                              null
                                          ? DateFormat('hh:mm a').format(state
                                                  .dateTaskSlots?[index]
                                                  .createdAt ??
                                              DateTime.now())
                                          : ""),
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
                    )
                  else if (state is ListScreenEmptystate)
                    const EmptyWidget(
                      height: 400,
                    )
                  else if (state is ListScreenFailState)
                    const FailureWidget(
                      height: 400,
                    )
                  else if (state is ListScreenLoadState)
                    Expanded(
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
                              SizedBox(height: 16.0),
                            ],
                          );
                        },
                      ),
                    )
                ],
              );
            },
          ),
        ));
  }
}
