class TaskModel {
  final int id;
  final String title;
  final String description;
  bool isCompleted;
  final double? latitude;
  final double? longitude;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.latitude,
    this.longitude,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      latitude: (json['latitude'] != null) ? json['latitude'].toDouble() : null,
      longitude:
          (json['longitude'] != null) ? json['longitude'].toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    double? latitude,
    double? longitude,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
