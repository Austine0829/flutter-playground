class Person {
  int? id;
  String name;
  int? age;

  Person({
    this.id,
    required this.name,
    this.age
  });

  Map<String, dynamic> fromObjectToMap() {
    return {
      "id": id,
      "name": name,
      "age": age
    };
  }

  factory Person.fromMapToObject(Map<String, dynamic> map) {
    return Person(
      id: map["id"], 
      name: map["name"] as String, 
      age: map["age"]
    );
  }
}