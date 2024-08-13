import 'package:dms/modules/list_screen/domain/entities/list_screen_etitites_model.dart';

abstract class ListScreenState {}

class ListScreenInitial extends ListScreenState {}

class ListScreenBackstate extends ListScreenState {}

class ListScreenEmptystate extends ListScreenState {}

class SearchTaskEmptystate extends ListScreenState {}

class ListScreenFailState extends ListScreenState {}

class ListScreenLoadState extends ListScreenState {
  ListScreenAttributeModel? listScreenAttributeModel;
  ListScreenLoadState(this.listScreenAttributeModel);
}

class ListScreenSuccessState extends ListScreenState {
  ListScreenAttributeModel? listScreenAttributeModel;
  ListScreenSuccessState(this.listScreenAttributeModel);
}

class DateTaskSlotSuccessState extends ListScreenState {
  ListScreenAttributeModel? listScreenAttributeModel;
  List<ListScreenAttributeItems>? dateTaskSlots;
  List<ListScreenAttributeItems>? statusFilter;
  DateTaskSlotSuccessState(
      {this.listScreenAttributeModel, this.statusFilter, this.dateTaskSlots});
}
