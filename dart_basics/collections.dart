// ignore_for_file: equal_elements_in_set

void main() {
  print("List");
  List<String> names = ["Austine", "Audrey", "Tuazon"];

  print(names);

  print("\nMap");
  Map<int, String> employees = {
    1143: "Austine Tuazon",
    3324: "Audrey Basilio"
  };

  print(employees);
  print(employees[1143]);

  print("\nSet");
  Set<int> numbers = {1, 2, 3, 4, 5, 5};

  print(numbers);

  print("\nCollection with if statement and spread operator");
  bool showExtra = true;
  List<int> otherItems = [4, 5, 6];

  List<int> items = [1, 2, 3, if (showExtra) ...otherItems];

  print(items);
}