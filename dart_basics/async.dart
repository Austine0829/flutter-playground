Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Returning Data";
}

Future<String> fetchErrorData() async {
  await Future.delayed(Duration(seconds: 10));
  throw "Returning Error";
}

void main() async {
  
  print("Fetching Data");
  String data = await fetchData();
  print(data);

  print("\nFetching Data using then");
  fetchData().then((data) => {
    print(data)
  });

  print("\nFetching Error Data");
  try {
    String data = await fetchErrorData();
    print(data);

  } catch (e) {
    print(e);
  }
}