
// Class
class Person {
  String? _name;
  int? _age;

  Person({required String name, int? age}) {
    this._name = name;
    this._age = age;
  }

  void Information() {
    print("Name: ${_name}");
    print(" Age: ${_age}");
  }
}

// Const & Final
class Song {
  final String name;
  static const String _publisher = "MGO";

  Song(this.name);

  void Title() {
    print("Title: $name");
  }

  void Publisher() => print("Publisher: $_publisher");
}

// Named Constructor
// class Animal {
//   String name;

//   Animal(this.name);
//   Animal.initialize(String n) : name = n;
// }

// Inhertiecance & Abstraction
abstract class Animal {
  void eat() => print("Eating");
  void speak();
} 

class Dog extends Animal {
  void eat() => print("Eating Dog Food");
  @override void speak() => print("Barking");
}

void main() {
  Dog d = Dog();

  d.speak();
  d.eat();
}