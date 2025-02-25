import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/people_bloc.dart';
import '../blocs/people_event.dart';
import '../models/person_model.dart';

class UpdatePersonScreen extends StatefulWidget {
  final Person person;

  UpdatePersonScreen({required this.person});

  @override
  _UpdatePersonScreenState createState() => _UpdatePersonScreenState();
}

class _UpdatePersonScreenState extends State<UpdatePersonScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.person.name;
    _ageController.text = widget.person.age.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Update Person')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _ageController, decoration: InputDecoration(labelText: 'Age'), keyboardType: TextInputType.number),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<PeopleBloc>(context).add(
                  UpdatePerson(
                    person: widget.person,
                    newName: _nameController.text,
                    newAge: int.parse(_ageController.text),
                  ),
                );
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
