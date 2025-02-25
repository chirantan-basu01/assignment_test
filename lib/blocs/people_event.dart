import '../models/person_model.dart';

abstract class PeopleEvent {}

class LoadPeople extends PeopleEvent {}

class UpdatePerson extends PeopleEvent {
  final Person person;
  final String newName;
  final int newAge;

  UpdatePerson({required this.person, required this.newName, required this.newAge});
}
