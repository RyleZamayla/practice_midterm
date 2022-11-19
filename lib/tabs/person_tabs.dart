import 'package:flutter/material.dart';
import 'package:practice_final/forms/person_form.dart';

class Person extends StatefulWidget {
  final person_list;
  const Person({required this.person_list, Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {

  var getModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: widget.person_list.length,
          itemBuilder: (context, index) {
            var person = widget.person_list[index];

            return Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              child: ListTile(
                title: Text(person.fname),
                subtitle: Text(person.id.toString()),
                ),
                onDismissed: (direction){
                widget.person_list.remove(index);
            },
            );

          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () async {
          getModel = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => PersonForm()));
          setState(() {
            widget.person_list.add(getModel);
          });
        },
      ),
    );
  }
}
