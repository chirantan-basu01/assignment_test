import 'package:flutter/material.dart';
import '../models/person_model.dart';
import '../screens/edit_person_screen.dart';
import '../screens/update_person_screen.dart';

class NestedPersonItem extends StatefulWidget {
  final Person person;
  NestedPersonItem({required this.person});

  @override
  _NestedPersonItemState createState() => _NestedPersonItemState();
}

class _NestedPersonItemState extends State<NestedPersonItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.person.name, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${widget.person.age} Years Old"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdatePersonScreen(person: widget.person),
                      ),
                    );
                  },
                ),
                if (widget.person.children.isNotEmpty)
                  IconButton(
                    icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () => setState(() => isExpanded = !isExpanded),
                  ),
              ],
            ),
          ),
          if (isExpanded)
            Column(
              children: widget.person.children
                  .map((child) => Padding(
                padding: EdgeInsets.only(left: 16),
                child: NestedPersonItem(person: child),
              ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
