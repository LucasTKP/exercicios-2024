// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chuva_dart/models/people_model.dart';

class ActivityModel {
  ActivityModel({
    required this.id,
    required this.title,
    required this.titleCategory,
    required this.description,
    required this.type,
    required this.color,
    required this.location,
    required this.dateStarted,
    required this.dateEnd,
    required this.peoples,
    required this.isScheduled,
  });

  final int id;
  final String title;
  final String titleCategory;
  final String? description;
  final String type;
  final String color;
  final String location;
  final DateTime dateStarted;
  final DateTime dateEnd;
  final List<PeopleModel>? peoples;
  final bool isScheduled;

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      title: json['title']['pt-br'] ?? '',
      titleCategory: json['category']['title']['pt-br'] ?? '',
      description: json['description']['pt-br'],
      type: json['type']['title']['pt-br'] ?? '',
      color: json['category']['color'] ?? '',
      location: json['locations'][0]['title']['pt-br'] ?? '',
      dateStarted: DateTime.parse(json['start']),
      dateEnd: DateTime.parse(json['end']),
      peoples: List.from(json['people']).map((e) => PeopleModel.fromJson(e)).toList(),
      isScheduled: false,
    );
  }

  @override
  String toString() {
    return 'ActivityModel(title: $title, titleCategory: $titleCategory, description: $description, type: $type, color: $color, location: $location, dateStarted: $dateStarted, dateEnd: $dateEnd, peoples: $peoples, isScheduled: $isScheduled)';
  }

  ActivityModel copyWith({
    int? id,
    String? title,
    String? titleCategory,
    String? description,
    String? type,
    String? color,
    String? location,
    DateTime? dateStarted,
    DateTime? dateEnd,
    List<PeopleModel>? peoples,
    bool? isScheduled,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      title: title ?? this.title,
      titleCategory: titleCategory ?? this.titleCategory,
      description: description ?? this.description,
      type: type ?? this.type,
      color: color ?? this.color,
      location: location ?? this.location,
      dateStarted: dateStarted ?? this.dateStarted,
      dateEnd: dateEnd ?? this.dateEnd,
      peoples: peoples ?? this.peoples,
      isScheduled: isScheduled ?? this.isScheduled,
    );
  }
}
