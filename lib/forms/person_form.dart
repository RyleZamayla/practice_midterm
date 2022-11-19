import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:practice_final/models/person_model.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({Key? key}) : super(key: key);

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  var genderVal;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Person Form Input"),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: idController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: ("202030281912"), labelText: ("Enter your ID:")),
              validator: (value) {
                return value == null || value.isEmpty ? "Enter Your ID!" : null;
              },
            ),
            TextFormField(
              controller: fnameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: ("Joshua Ryle:"), labelText: ("First Name:")),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Enter First Name!"
                    : null;
              },
            ),
            TextFormField(
              controller: mnameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: ("Zamayla:"), labelText: ("Middle Name:")),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Enter Middle Name!"
                    : null;
              },
            ),
            TextFormField(
              controller: lnameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: ("Bracho:"), labelText: ("Last Name:")),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Enter Last Name!"
                    : null;
              },
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.text,
              decoration:
                  const InputDecoration(hintText: ("18:"), labelText: ("Age:")),
              validator: (value) {
                return value == null || value.isEmpty ? "Enter Age!" : null;
              },
            ),
            TextFormField(
              controller: occupationController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: ("Stripper"), labelText: ("Occupation:")),
              validator: (value) {
                return value == null || value.isEmpty
                    ? "Enter Last Name!"
                    : null;
              },
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(labelText: "Gender"),
                items: const [
                  DropdownMenuItem(
                    value: "Male",
                    child: Text("Male"),
                  ),
                  DropdownMenuItem(
                    value: "Female",
                    child: Text("Female"),
                  ),
                  DropdownMenuItem(
                    value: "Others",
                    child: Text("Others"),
                  )
                ],
                onChanged: (value) {
                  genderVal = value.toString();
                }),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var storeModel = PersonModel(
                        age: int.parse(ageController.text),
                        fname: fnameController.text,
                        id: int.parse(idController.text),
                        lname: lnameController.text,
                        mname: mnameController.text,
                        occupation: occupationController.text,
                        gender: genderVal);
                    Navigator.pop(context, storeModel);
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
