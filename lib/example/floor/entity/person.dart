// entity/person.dart
import 'package:floor/floor.dart';

@entity
class Person {
  @primaryKey
  final int id;

  final String name;

  Person({this.id, this.name});

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      id: json["id"] == null ? null : json["id"],
      name: json["name"] == null ? null : json["name"]);

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
      };
}
