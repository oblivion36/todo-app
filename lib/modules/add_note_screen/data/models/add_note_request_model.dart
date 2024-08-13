class AddNoteRequestModel {
  String? title;
  String? description;
  bool? isCompleted;
  String? createdAt;

  AddNoteRequestModel({
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
  });

  factory AddNoteRequestModel.fromJson(Map<String, dynamic> json) =>
      AddNoteRequestModel(
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "title": title ?? "",
        "description": description ?? "",
        "is_completed": (isCompleted ?? false).toString(),
        "created_at": createdAt ?? "",
      };
}
