abstract class DetailViewDeleteEvent {}

class DetailViewDeleteInitialEvent extends DetailViewDeleteEvent {
  String? uid;
  DetailViewDeleteInitialEvent(this.uid);
}

class DetailViewEditInitialEvent extends DetailViewDeleteEvent {
  String? uid;
  DetailViewEditInitialEvent(this.uid);
}
