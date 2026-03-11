import 'package:flutter/material.dart';
import 'package:sqlite_basics_2/db/person_repository.dart';
import 'package:sqlite_basics_2/models/person.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {

 final _formkey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                hintText: "Enter name",
                border: OutlineInputBorder()
              ),
            ),
            Divider(),
            TextFormField(
              controller: _age,
              decoration: InputDecoration(
                hintText: "Enter age",
                border: OutlineInputBorder()
              ),
            ),
            Divider(),
            ElevatedButton(onPressed: () async {
              await PersonRepository.addPerson(
                Person(name: _name.text, age: int.parse(_age.text)).fromObjectToMap()
              );

              setState(() {
                _name.text = "";
                _age.text = "";
              });
            }, child: Text("Submit"))
          ],
        ) 
      )
    );
  }
}