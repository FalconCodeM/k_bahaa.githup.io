import 'package:k_bahaa/app/data/models/pods_model.dart';

class TrainingModel {
  final List<Pod> pods;
  final int podsCount;
  final String startTraining;
  final int pods1;
  final int pods2;
  final int pods3;
  final int pods4;
  final int pods5;
  final int pods6;

  TrainingModel({
    required this.pods,
    required this.podsCount,
    required this.startTraining,
    required this.pods1,
    required this.pods2,
    required this.pods3,
    required this.pods4,
    required this.pods5,
    required this.pods6,
  });

  // Factory constructor to create a TrainingModel from JSON
  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      pods: (json['pods'] as List<dynamic>)
          .map((item) => Pod.fromJson(item))
          .toList(),
      podsCount: json['podsCount'],
      startTraining: json['startTraining'],
      pods1: json['pods1'],
      pods2: json['pods2'],
      pods3: json['pods3'],
      pods4: json['pods4'],
      pods5: json['pods5'],
      pods6: json['pods6'],
    );
  }

  // Method to convert a TrainingModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'pods': pods.map((item) => item.toJson()).toList(),
      'podsCount': podsCount,
      'startTraining': startTraining,
      'pods1': pods1,
      'pods2': pods2,
      'pods3': pods3,
      'pods4': pods4,
      'pods5': pods5,
      'pods6': pods6,
    };
  }

  // copyWith method
  TrainingModel copyWith({
    List<Pod>? pods,
    int? podsCount,
    String? startTraining,
    int? pods1,
    int? pods2,
    int? pods3,
    int? pods4,
    int? pods5,
    int? pods6,
  }) {
    return TrainingModel(
      pods: pods ?? this.pods,
      podsCount: podsCount ?? this.podsCount,
      startTraining: startTraining ?? this.startTraining,
      pods1: pods1 ?? this.pods1,
      pods2: pods2 ?? this.pods2,
      pods3: pods3 ?? this.pods3,
      pods4: pods4 ?? this.pods4,
      pods5: pods5 ?? this.pods5,
      pods6: pods6 ?? this.pods6,
    );
  }
}
