import 'dart:async';
import 'dart:convert';

import 'package:dms/modules/list_screen/data/models/list_screen_model.dart';
import 'package:dms/modules/list_screen/domain/entities/list_screen_etitites_model.dart';
import 'package:dms/modules/list_screen/domain/usecases/list_screen_usecase.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_event.dart';
import 'package:dms/modules/list_screen/presentation/bloc/list_screen_state.dart';
import 'package:dms/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  ListScreenAttributeModel? listScreenAttributeModel;
  final TextEditingController searchTextController = TextEditingController();
  List<ListScreenAttributeItems> searchedTaskSlots = [];
  List<ListScreenAttributeItems> dateTaskSlots = [];
  List<ListScreenAttributeItems> statusFilter = [];
  String message = "";

  int count = 1;
  bool? morepage;

  ListScreenBloc() : super(ListScreenInitial()) {
    on<ListScreenInitialEvent>(listScreenInitial);
    on<FetchMoreItemsEvent>(fetchMoreItems);
    on<DateTasksEvent>(
      dateTasksEvent,
    );

    on<StatusFilterEvent>(
      statusFilterEvent,
    );

    on<SearchTasksEvent>(
      (event, emit) {
        if (searchTextController.text.isEmpty ||
            searchTextController.text == "" ||
            searchTextController.text == null) {
          searchedTaskSlots = [];

          add(ListScreenInitialEvent());
        } else {
          searchedTaskSlots = [];
          bool isMatchFound = false;

          listScreenAttributeModel?.items?.forEach((e) {
            if (e.title?.toLowerCase().contains(
                      searchTextController.text.toLowerCase(),
                    ) ==
                true) {
              searchedTaskSlots.add(e);

              isMatchFound = true;
              emit(ListScreenSuccessState(listScreenAttributeModel));
            }
          });

          if (!isMatchFound) {
            message = "No data found";
            emit(ListScreenEmptystate());
          }
        }
      },
    );
  }

  Future<FutureOr<void>> dateTasksEvent(
      DateTasksEvent event, Emitter<ListScreenState> emit) async {
    add(ListScreenInitialEvent());

    await Future.delayed(Duration(seconds: 2));
    dateTaskSlots = [];
    bool isMatchFound = false;

    listScreenAttributeModel?.items?.forEach((e) {
      final formattedDate =
          DateFormat('yyyy-MM-dd').format(e.createdAt ?? DateTime.now());
      if (formattedDate == event.selectedDate) {
        dateTaskSlots.add(e);
        isMatchFound = true;
      }
      emit(DateTaskSlotSuccessState(
          dateTaskSlots: dateTaskSlots,
          listScreenAttributeModel: listScreenAttributeModel));
    });

    if (dateTaskSlots == [] || dateTaskSlots.isEmpty || dateTaskSlots == null) {
      emit(ListScreenEmptystate());
    }
  }

  Future<FutureOr<void>> statusFilterEvent(
      StatusFilterEvent event, Emitter<ListScreenState> emit) async {
    add(ListScreenInitialEvent());

    await Future.delayed(Duration(seconds: 2));
    statusFilter = [];
    bool isMatchFound = false;
    print("statussssssssssssssssssssssssss ${event.status}");
    if (event.status == 'Done') {
      print("heyyyyyyyyyyyyyyyy doneeeeeeeeeeeeeeeeeeeee");
      listScreenAttributeModel?.items?.forEach((e) {
        if (e.isCompleted == true) {
          statusFilter.add(e);
          isMatchFound = true;
        }
        emit(DateTaskSlotSuccessState(
            statusFilter: statusFilter,
            listScreenAttributeModel: listScreenAttributeModel));
      });
    } else {
      print("hey elseeeeeeeeeeeeeeeeeeeeee");
      listScreenAttributeModel?.items?.forEach((e) {
        if (e.isCompleted == false) {
          statusFilter.add(e);
          isMatchFound = true;
        }
        emit(DateTaskSlotSuccessState(
            statusFilter: statusFilter,
            listScreenAttributeModel: listScreenAttributeModel));
      });
    }

    if (statusFilter == [] || statusFilter.isEmpty || statusFilter == null) {
      emit(ListScreenEmptystate());
    }
  }

  Future<FutureOr<void>> listScreenInitial(
      ListScreenInitialEvent event, Emitter<ListScreenState> emit) async {
    emit(ListScreenLoadState(listScreenAttributeModel));

    (searchTextController.text.isEmpty ||
            searchTextController.text == "" ||
            searchTextController.text == null)
        ? null
        : null;
    final repository = serviceLocator<ListScreenUsecase>();
    final response = await repository.invoke(1);

    if (response.isLeft) {
      emit(ListScreenFailState());
    } else {
      try {
        final listSCreenModel =
            listScreenModelFromJson(jsonEncode(response.right));
        listScreenAttributeModel = ListScreenAttributeModel(
            code: listSCreenModel.code ?? 0,
            success: listSCreenModel.success ?? false,
            message: listSCreenModel.message ?? "",
            timestamp: listSCreenModel.timestamp ?? 0,
            items: listSCreenModel.items
                ?.map((e) => ListScreenAttributeItems(
                    description: e.description ?? "",
                    createdAt: e.createdAt ?? DateTime.now(),
                    id: e.id ?? "",
                    isCompleted: e.isCompleted ?? false,
                    title: e.title ?? "",
                    updatedAt: e.updatedAt ?? DateTime.now()))
                .toList(),
            meta: ListScreenMetaItems(
                currentPage: listSCreenModel.meta?.currentPage ?? 0,
                hasMorePage: listSCreenModel.meta?.hasMorePage ?? false,
                pageSize: listSCreenModel.meta?.pageSize ?? 0,
                perPageItem: listSCreenModel.meta?.perPageItem ?? 0,
                totalItems: listSCreenModel.meta?.totalItems ?? 0,
                totalPages: listSCreenModel.meta?.totalPages ?? 0));

        if (listScreenAttributeModel?.items == [] ||
            listScreenAttributeModel?.items?.isEmpty == true ||
            listScreenAttributeModel == null) {
          emit(ListScreenEmptystate());
        } else {
          morepage = listScreenAttributeModel?.meta?.hasMorePage;

          emit(ListScreenSuccessState(listScreenAttributeModel));
        }
      } catch (e) {
        emit(ListScreenFailState());
      }
    }
  }

  Future<FutureOr<void>> fetchMoreItems(
      FetchMoreItemsEvent event, Emitter<ListScreenState> emit) async {
    final repository = serviceLocator<ListScreenUsecase>();
    final response = await repository.invoke(event.count);
    if (response.isLeft) {
      emit(ListScreenFailState());
    } else {
      try {
        final listSCreenModel =
            listScreenModelFromJson(jsonEncode(response.right));

        final moreItems = listSCreenModel.items
            ?.map((e) => ListScreenAttributeItems(
                description: e.description ?? "",
                createdAt: e.createdAt ?? DateTime.now(),
                id: e.id ?? "",
                isCompleted: e.isCompleted ?? false,
                title: e.title ?? "",
                updatedAt: e.updatedAt ?? DateTime.now()))
            .toList();

        listScreenAttributeModel?.items?.addAll(moreItems ?? []);

        if (listScreenAttributeModel?.items == [] ||
            listScreenAttributeModel?.items?.isEmpty == true ||
            listScreenAttributeModel == null) {
          emit(ListScreenEmptystate());
        } else {
          morepage = listSCreenModel.meta?.hasMorePage;

          emit(ListScreenSuccessState(listScreenAttributeModel));
        }
      } catch (e) {
        emit(ListScreenFailState());
      }
    }
  }
}
