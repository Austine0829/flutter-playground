void main() {
  int age = 18;
  int minAge = 18; 

  if (age >= minAge) {
    print("Is Allowed");
  } else {
    print("Is Not Allowed");
  }

  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  while (age != 0) {
    print(age);
    age--;
    if (age == 5) {
      print("Just hit 5 at age variable!");
      break;
    }
  }
}