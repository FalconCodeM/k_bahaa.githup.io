import 'package:equatable/equatable.dart';
import 'package:k_bahaa/app/data/models/training_model.dart';


class User extends Equatable {
  final String name;
  final List<TrainingModel> trainingData;
  final String trainingTime;

  const User({
    required this.name,
    required this.trainingData,
    required this.trainingTime,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      trainingData: (json['trainingData'] as List<dynamic>)
          .map((item) => TrainingModel.fromJson(item))
          .toList(),
      trainingTime: json['trainingTime'],
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'trainingData': trainingData.map((item) => item.toJson()).toList(),
      'trainingTime': trainingTime,
    };
  }

  // copyWith method
  User copyWith({
    String? name,
    List<TrainingModel>? trainingData,
    String? trainingTime,
  }) {
    return User(
      name: name ?? this.name,
      trainingData: trainingData ?? this.trainingData,
      trainingTime: trainingTime ?? this.trainingTime,
    );
  }

  @override
  List<Object?> get props => [name];
}
