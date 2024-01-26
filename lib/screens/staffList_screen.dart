import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:visitors2023/helper/database_services.dart';
import 'package:visitors2023/widget/utils/colors.dart';
class StaffListPage extends StatefulWidget {
  final String departmentId;
  final String departmentName;

  StaffListPage({required this.departmentId, required this.departmentName});

  @override
  _StaffListPageState createState() => _StaffListPageState();
}

class _StaffListPageState extends State<StaffListPage> {
  Stream? staffStream;

  @override
  void initState() {
    super.initState();
    staffStream = DatabaseServices().getStaffDetailsForDepartment(widget.departmentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(widget.departmentName),
      centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          //we register departments, department name,
          children: [Expanded(child: allStaffDetails())],
        ),
      ),
    );
  }

  Widget allStaffDetails() {
    return StreamBuilder(
      stream: staffStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
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
                            Text(
                              "Name: " + ds["Name"],
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Email: " + ds["Email"],
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Phone Number: " + ds["PhoneNumber"],
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container();
      },
    );
  }
}

// Modified _DashboardScreenState

