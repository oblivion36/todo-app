abstract class ListScreenEvent {}

class ListScreenInitialEvent extends ListScreenEvent {}

class SearchTasksEvent extends ListScreenEvent {}

class StatusFilterEvent extends ListScreenEvent {
  String? status;
  StatusFilterEvent({this.status});
}

class DateTasksEvent extends ListScreenEvent {
  final String? selectedDate;
  DateTasksEvent({this.selectedDate});
}

class FetchMoreItemsEvent extends ListScreenEvent {
  final int count;

  FetchMoreItemsEvent({this.count = 2});
}
