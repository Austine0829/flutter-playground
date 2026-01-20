mixin Flyable on Flying {
  void fly() => print("Flyin~~~");
}

class Flying {

}

class Bird extends Flying with Flyable {

}

class Airplane extends Flying with Flyable {

}

void main() {
  Bird b = Bird();
  Airplane a = Airplane();

  b.fly();
  a.fly();
}