import 'package:flutter/material.dart';
import 'package:sqlite_basics_2/db/database_helper.dart';
import 'package:sqlite_basics_2/models/person.dart';
import 'package:sqlite_basics_2/pages/user/update_page.dart';
import 'package:sqlite_basics_2/services/person_service.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({super.key});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  List<Person> persons = [];

  @override 
  void initState() {
    super.initState();
    getAllPerson();
  }

  Future<void> getAllPerson() async {
    final data = await PersonService.getAllPerson();

    setState(() {
      persons = data;
    });
  }

  @override 
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: (_, index) {
        return Row(
          children: [
            Text("Name: ${persons[index].name}, \nAge: ${persons[index].age}"),
            TextButton(onPressed: () async {
              final updateduser = await Navigator.push<Person>(
                context, 
                MaterialPageRoute(
                  builder: (_) => UpdatePage(id: persons[index].id!)
                )
              );

              if (updateduser != null) {
                setState(() {
                  persons[index] = updateduser;
                });
              }
            }, child: Text("Update")),
            TextButton(onPressed: () {
              DatabaseHelper.instance.deleteUser(persons[index].id!);
              setState(() {
                getAllPerson();
              });
            }, 
            child: Text("Delete"))
          ],
        );
    });
  }
}
