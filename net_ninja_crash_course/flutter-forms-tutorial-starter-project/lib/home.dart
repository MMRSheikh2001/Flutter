import 'package:flutter/material.dart';
import 'package:flutter_forms_files/models/todo.dart';
import 'package:flutter_forms_files/todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final TextEditingController _emailController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();
  Priority _selectedPriority = Priority.low;

  String _title = "";
  String _description = "";

  final List<Todo> todos = [
    const Todo(
        title: 'Buy milk',
        description: 'There is no milk left in the fridge!',
        priority: Priority.high),
    const Todo(
        title: 'Make the bed',
        description: 'Keep things tidy please..',
        priority: Priority.low),
    const Todo(
        title: 'Pay bills',
        description: 'The gas bill needs paying ASAP.',
        priority: Priority.urgent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: TodoList(todos: todos)),

            // form stuff below here
//             TextField(
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 label: Text("Email Address")
//               ),
//
//             ),
//             const SizedBox(height: 16),
//             FilledButton(
//                 onPressed: (){
// print(_emailController.text.trim());
//                 },
//                 child: const Text('Submit')
//             )

            Form(
                key: _formGlobalKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //title
                      TextFormField(
                        maxLength: 20,
                        decoration:
                            const InputDecoration(label: Text("To Do Title")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _title = value!;
                        },
                      ),

                      //description
                      TextFormField(
                        maxLength: 200,
                        decoration: const InputDecoration(
                            label: Text("To Do Description")),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 10) {
                            return 'Please enter a valid Description least 10 characters';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _description = value!;
                        },
                      ),

                      //priority
                      DropdownButtonFormField(
                        initialValue: _selectedPriority,
                        decoration: const InputDecoration(
                            label: Text("To Do Priority")),
                        onChanged: (value) {
                          setState(() {
                            _selectedPriority = value!;
                          });
                        },
                        items: Priority.values.map((p) {
                          return DropdownMenuItem(
                            value: p,
                            child: Text(p.title),
                          );
                        }).toList(),
                      ),

                      //submit button
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () {
                          if (_formGlobalKey.currentState!.validate()) {
                            _formGlobalKey.currentState!.save();
                            setState(() {
                              todos.add(Todo(
                                  title: _title,
                                  description: _description,
                                  priority: _selectedPriority));
                            });
                            _formGlobalKey.currentState!.reset();
                            _selectedPriority = Priority.low;
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
