// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, camel_case_types
import 'package:equatable/equatable.dart';

class task extends Equatable {
  final String title;
  final String description;
  final String id;
  bool? isDone;
  bool? isDeleted;
  task({
    required this.title,
    required this.description,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  task copyWith({
    String? title,
    String? description,
    String? id,
    bool? isDone,
    bool? isDeleted,
  }) {
    return task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory task.fromMap(Map<String, dynamic> map) {
    return task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [title, description, id, isDone, isDeleted];
}
