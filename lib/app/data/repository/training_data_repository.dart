import 'package:k_bahaa/app/data/models/users_model.dart';
import 'package:k_bahaa/app/data/providers/training_data_provider.dart';

class TrainingDataRepository {
  TrainingDataProvider trainingDataProvider;

  TrainingDataRepository({required this.trainingDataProvider});

  List<User> readUsers() => trainingDataProvider.readUsers();

  void writeUsers(List<User> users) => trainingDataProvider.writeUsers(users);
}
