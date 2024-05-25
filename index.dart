import 'package:flutter/material.dart';
class index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Rest Api Example')),
        body: Center(
            child: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addDepartment');
                },
                child: Text('Add Department')),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/allDepartments');
                },
                child: Text('All Departments')),
          ],
        )));
  }
}
