int addNormal (int x, int y){
  return x + y;
}

int addArrow(int x, int y) => x + y; 

bool isAdultNormal(int age) {
  if (age < 18) 
    return false;

  return true;
}

bool isAdultArrow(int age) => age >= 18 ? true : false;

void main() {
  int normalResult = addNormal(10, 20);
  int arrowResult = addArrow(20, 40);

  print("Normal Result: $normalResult");
  print("Arrow Result: $arrowResult");

  print("Is Adult Normal: ${isAdultNormal(18)}");
  print("Is Adult Arrow: ${isAdultArrow(18)}");
}