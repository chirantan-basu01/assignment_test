import '../models/person_model.dart';

abstract class PeopleState {}

class PeopleLoading extends PeopleState {}

class PeopleLoaded extends PeopleState {
  final List<Person> people;
  PeopleLoaded({required this.people});
}
