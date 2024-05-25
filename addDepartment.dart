
import 'package:flutter/material.dart';
import 'package:restapi_cours/Services/DepartmentService.dart';
import '../model/Department.dart';

class AddDepartment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddDepartmentState();
  }
}


class AddDepartmentState extends State {
  var c_label = TextEditingController(); //control du label
  var c_mission = TextEditingController();//control de mission
  final key_add = GlobalKey<FormState>(); //clé du Form

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.home),
            ),
            title: Text('Add new Department')),
        body: Form(
            key: key_add,
            child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: c_label,
                      decoration: InputDecoration(
                          hintText: 'Department Label', label: Text('Label')),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Tape the department Lable';
                        else
                          return null;
                      },
                    ),
                    TextFormField(
                        controller: c_mission,
                        decoration: InputDecoration(
                            hintText: 'Department Mission',
                            label: Text('Mission')),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Tape the department mission';
                          else
                            return null;
                        }),
                    Row(children: [
                      Expanded(
                          child: ElevatedButton(
                        child: Text('Add'),
                        onPressed: () async {
                          if (this.key_add.currentState!.validate()) {
                            int res = await DepartmentService.addDepartment(
                                Department(
                                    label: this.c_label.text,
                                    mission: this.c_mission.text));
                            String msg = "";
                            if (res == 201)
                              msg = "Success Add";
                            else
                              msg = "Failed to Add";
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('$msg'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                    ],
                                  );
                                });

                            // Navigator.pushNamed(context, '/');

                          }
                        },
                      )),
                      Expanded(
                          child: TextButton(
                        child: Text('Reset'),
                        onPressed: () {
                          this.key_add.currentState!.reset();
                        },
                      ))
                    ])
                  ],
                ))));
  }
}
