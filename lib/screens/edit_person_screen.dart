// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../blocs/people_bloc.dart';
// import '../blocs/people_event.dart';
// import '../models/person_model.dart';
//
// class EditPersonScreen extends StatelessWidget {
//   final Person person;
//   final TextEditingController nameController;
//   final TextEditingController ageController;
//
//   EditPersonScreen({required this.person})
//       : nameController = TextEditingController(text: person.name),
//         ageController = TextEditingController(text: person.age.toString());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Update")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
//             TextField(controller: ageController, decoration: InputDecoration(labelText: "Age"), keyboardType: TextInputType.number),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 BlocProvider.of<PeopleBloc>(context).add(
//                   UpdatePerson(
//                     personId: person.id,
//                     newName: nameController.text,
//                     newAge: int.parse(ageController.text),
//                   ),
//                 );
//                 Navigator.pop(context);
//               },
//               child: Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
