import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/person_model.dart';
import 'people_event.dart';
import 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc() : super(PeopleLoading()) {
    on<LoadPeople>(_onLoadPeople);
    on<UpdatePerson>(_onUpdatePerson);
  }

  void _onLoadPeople(LoadPeople event, Emitter<PeopleState> emit) {
    List<Person> people = [
      Person(name: "Richard E. Meyer", age: 28),
      Person(
        name: "Stephanie S. Young",
        age: 28,
        children: [
          Person(
            name: "Richard E. Meyer",
            age: 28,
            children: [
              Person(name: "Richard E. Meyer", age: 28),
              Person(name: "Richard E. Meyer", age: 28),
            ],
          ),
          Person(
            name: "Richard E. Meyer",
            age: 28,
            children: [
              Person(name: "Richard E. Meyer", age: 28),
              Person(name: "Richard E. Meyer", age: 28),
            ],
          ),
        ],
      ),
    ];

    emit(PeopleLoaded(people: people));
  }

  void _onUpdatePerson(UpdatePerson event, Emitter<PeopleState> emit) {
    if (state is PeopleLoaded) {
      List<Person> updatedPeople = _updatePeopleList(
        (state as PeopleLoaded).people,
        event.person,
        event.newName,
        event.newAge,
      );
      emit(PeopleLoaded(people: updatedPeople));
    }
  }

  List<Person> _updatePeopleList(List<Person> people, Person target, String newName, int newAge) {
    return people.map((person) {
      if (person == target) {
        return person.copyWith(name: newName, age: newAge);
      } else if (person.children.isNotEmpty) {
        return person.copyWith(children: _updatePeopleList(person.children, target, newName, newAge));
      }
      return person;
    }).toList();
  }
}
