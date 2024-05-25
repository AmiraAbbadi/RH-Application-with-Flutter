import 'package:flutter/material.dart';
import 'package:restapi_cours/Services/DepartmentService.dart';

import '../model/Department.dart';
import 'detailDepartment.dart';

class AllDepartments extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AllDepartmentsState();
  }
}

class AllDepartmentsState extends State {
  //créer une liste vide
  List<Department>? allDepartments ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("All departments "),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.home),
          ),
        ),
        body: Center(
            child: FutureBuilder(
                future: loadData(),
                builder: (context, snapshot) {
                  if (allDepartments == null)
                    return Center(child: Text('No Departments'));
                  else
                    return ListView.builder(
                        itemBuilder: (BuildContext, int index) {
                          return Container(
                              margin: EdgeInsets.all(5),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  color: Colors.lightBlueAccent,
                                  elevation: 10,
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  detailDepartment(
                                                      department:
                                                      allDepartments![
                                                      index])));

                                    },
                                    child:ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor:  Colors.deepOrange,
                                        child: Text(
                                            allDepartments![index].id.toString()),
                                      ),
                                      title: Text("Lable : ${allDepartments![index].label}"),
                                      subtitle: Text("Mission : ${allDepartments![index].label}"),
                                      trailing: IconButton(icon:Icon(Icons.delete), onPressed: () async {

                                           int res = await DepartmentService.deleteDepartment(allDepartments![index].id!);
                                           SnackBar sn = SnackBar(content: Text("suppresion with res = $res"));
                                           ScaffoldMessenger.of(context).showSnackBar(sn);
                                           this.allDepartments!.elementAt(index);
                                           setState(() {

                                           });




                                      },)
                                      ,
                                    )
                                  )));
                        },
                        itemCount: allDepartments!.length);
                })));
  }

  loadData() async {
    Future<List<Department>?> res =  DepartmentService.getDepartments();
    //après la récupération du résultat de DepartmentService.getDepartments();
    res.then((value) {
      setState(() {
        this.allDepartments = value;
      });
    });

    return res;
  }
}
