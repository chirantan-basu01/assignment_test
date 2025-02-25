import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/people_bloc.dart';
import '../blocs/people_state.dart';
import '../models/person_model.dart';
import 'update_person_screen.dart';

class PeopleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Details')),
      body: BlocBuilder<PeopleBloc, PeopleState>(
        builder: (context, state) {
          if (state is PeopleLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PeopleLoaded) {
            return ListView(
              children: state.people.map((person) => _buildPersonTile(context, person)).toList(),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildPersonTile(BuildContext context, Person person) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(person.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${person.age} Years Old'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Edit icon
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdatePersonScreen(person: person)),
              ),
            ),
            // Expand/Collapse Arrow
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        children: person.children.map((child) => _buildPersonTile(context, child)).toList(),
      ),
    );
  }
}
