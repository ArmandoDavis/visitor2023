import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:visitors2023/helper/database_services.dart';
import 'package:visitors2023/screens/staffList_screen.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/appcolors.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _stafffNameController = TextEditingController();
  final TextEditingController _staffEmailController = TextEditingController();
  final TextEditingController _staffContactController = TextEditingController();

  Stream? DepartmentStream;

  getOnTheLoad() async {
    DepartmentStream = await DatabaseServices().getDepartmentDetails();
    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  Widget allDepartmentDetails() {
    return StreamBuilder(
      stream: DepartmentStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return FutureBuilder(
                    future:
                        DatabaseServices().getStaffCountForDepartment(ds["Id"]),
                    builder: (context, AsyncSnapshot<int> countSnapshot) {
                      if (countSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Loading state
                        return CircularProgressIndicator();
                      } else if (countSnapshot.hasError) {
                        // Error state
                        return Text('Error: ${countSnapshot.error}');
                      } else {
                        // Success state
                        int staffCount = countSnapshot.data ?? 0;

                        return GestureDetector(
                          onTap: () {
                            nextScreen(
                                context,
                                StaffListPage(
                                  departmentId: ds["Id"],
                                  departmentName: ds["Name"],
                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Material(
                              elevation: 2.0,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Department Name: " + ds["Name"],
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            createStaffdetail(ds["Id"]);
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.orange,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Members: $staffCount",
                                      style: TextStyle(
                                          color: const Color.fromRGBO(
                                              255, 152, 0, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "ID: " + ds["Id"],
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "Department Management"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          //we register departments, department name,
          children: [Expanded(child: allDepartmentDetails())],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: SmallText(text: "Create a Department"),
                content: Column(
                  children: [
                    TextField(
                      controller: _departmentController,
                      decoration: InputDecoration(labelText: 'Department Name'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      createDepartmentAndShowToast();
                      // Close the dialog
                    },
                    child: Text('Create'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, color: AppColors.backgroundColor),
      ),
    );
  }

  Future createDepartmentAndShowToast() async {
    String id = randomAlphaNumeric(10);
    Map<String, dynamic> departmentInfoMap = {
      "Name": _departmentController.text,
      "Id":  _departmentController.text,
    };

    await DatabaseServices(uid: id)
        .createDepartmentDetails(departmentInfoMap, id)
        .then((value) {
      Navigator.pop(context); // Close the dialog first
      Fluttertoast.showToast(
        msg: "Department has been added successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  Future createStaffdetail(String departmentId) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.cancel),
                      ),
                      SizedBox(width: 40),
                      BigText(
                        text: "Add in",
                        color: Colors.blue,
                        size: 24,
                      ),
                      BigText(
                        text: "Staff",
                        color: Colors.orange,
                        size: 24,
                      ),
                    ],
                  ),
                  SmallText(
                    text: "Name",
                    size: 20,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _stafffNameController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20),
                  SmallText(
                    text: "Email",
                    size: 20,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _staffEmailController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 20),
                  SmallText(
                    text: "Phone Number",
                    size: 20,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _staffContactController,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        String staffId = randomAlphaNumeric(
                            10); // Generate a random staff ID
                        Map<String, dynamic> staffInfoMap = {
                          "Name": _stafffNameController.text,
                          "Email": _staffEmailController.text,
                          "PhoneNumber": _staffContactController.text,
                          "Id": staffId,
                          "DepartmentId": departmentId
                        };
                        await DatabaseServices(uid: departmentId)
                            .addStaffToDepartment(staffInfoMap);
                        Navigator.pop(context);
                      },
                      child: SmallText(text: "Add"),
                    ),
                  )
                ],
              ),
            ),
          ));
}
