import 'dart:convert';

CreateTaskModel createTaskModelFromJson(String str) => CreateTaskModel.fromJson(json.decode(str));

String createTaskModelToJson(CreateTaskModel data) => json.encode(data.toJson());

class CreateTaskModel {
  final String? title;
  final String? description;
  final String? email;
  final DateTime? createdDate;
  final String? id;

  CreateTaskModel({
    this.title,
    this.description,
    this.email,
    this.createdDate,
    this.id,
  });

  factory CreateTaskModel.fromJson(Map<String, dynamic> json) => CreateTaskModel(
    title: json["title"],
    description: json["description"],
    email: json["email"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "email": email,
    "createdDate": createdDate?.toIso8601String(),
    "_id": id,
  };
}
