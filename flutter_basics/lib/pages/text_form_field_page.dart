import 'package:flutter/material.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  String firstName = "";
  String lastName = "";

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Form Demo")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12), 
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstName,
                decoration: InputDecoration(
                  label: Text("First Name"),
                  border: OutlineInputBorder()
                ),
                validator: (firstName) {
                  if (firstName == null || firstName.isEmpty) return "first name should not be empty";

                  return null;
                }
              ),
              
              SizedBox(height: 10),

              TextFormField(
                controller: _lastName,
                decoration: InputDecoration(
                  label: Text("Last Name"),
                  border: OutlineInputBorder()
                ),
                validator: (lastName) {
                  if (lastName == null || lastName.isEmpty) return "last name should not be empty";

                  return null;
                },
              ),

              SizedBox(height: 10),

              ElevatedButton(onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Valid Form State"))
                    );

                    setState(() {
                      firstName = _firstName.text;
                      lastName = _lastName.text;
                    });
                  }

                }, child: Text("Submit")
              ),

              SizedBox(height: 10),

              Text("Result: $firstName $lastName")
            ]
          )
        ),
      )
    );
  }
}