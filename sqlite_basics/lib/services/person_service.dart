import 'package:sqlite_basics_2/db/person_repository.dart';
import 'package:sqlite_basics_2/models/person.dart';

class PersonService {
  
  static Future<List<Person>> getAllPerson() async {
    final persons = await PersonRepository.getAllPerson();

    return persons.map((person) => Person.fromMapToObject(person)).toList();
  }
}