// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:visitors2023/helper/database_services.dart';
import 'package:visitors2023/pages/devices/desktopAppbar.dart';
import 'package:visitors2023/pages/home/homepage.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';
import 'package:visitors2023/widget/widget.dart';

enum VisitType {
  newVisitor,
  recurringVisitor,
  invitedVisitor,
}

class CheckInVisitors extends StatefulWidget {
  const CheckInVisitors({super.key});

  @override
  State<CheckInVisitors> createState() => _CheckInVisitorsState();
}

class _CheckInVisitorsState extends State<CheckInVisitors> {
  VisitType _selectedVisitType = VisitType.newVisitor;
  final _formKey = GlobalKey<FormState>();

  bool showMoreFields = false;
  bool isSwitched = false;
  bool _isLoading = false;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController purposeController = TextEditingController();

  String? selectedBranch;
  String? selectedHost;

  File? image;

  List<String> listItem = ["Branch 1", "Branch 2", "Branch 3", "Branch 4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.width20(context),
            top: Dimensions.height20(context),
            right: Dimensions.width20(context),
            bottom: Dimensions.height20(context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        nextScreenReplace(context, HomePage());
                      },
                      icon: Icon(Icons.arrow_back_ios)),
                  SizedBox(width: Dimensions.width50(context)),
                  Expanded(child: DesktopAppBar(head: "Add/Check in")),
                ],
              ),
              SizedBox(height: Dimensions.height30(context)),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: Dimensions.width50(context)),
                height: Dimensions.height800(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius10(context))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(Dimensions.height20(context)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedVisitType = VisitType.newVisitor;
                              });
                            },
                            child: _selectedVisitType == VisitType.newVisitor
                                ? BigText(text: "New Visitor")
                                : SmallText(text: "New Visitor"),
                          ),
                          SizedBox(width: Dimensions.width20(context)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedVisitType = VisitType.recurringVisitor;
                              });
                            },
                            child:
                                _selectedVisitType == VisitType.recurringVisitor
                                    ? BigText(text: "Recurring Visitor")
                                    : SmallText(text: "Recurring Visitor"),
                          ),
                          SizedBox(width: Dimensions.width20(context)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedVisitType = VisitType.invitedVisitor;
                              });
                            },
                            child:
                                _selectedVisitType == VisitType.invitedVisitor
                                    ? BigText(text: "Invited Visitor")
                                    : SmallText(text: "Invited Visitor"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20(context),
                          right: Dimensions.width20(context),
                          bottom: Dimensions.height20(context)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.radius20(context)),
                            topRight:
                                Radius.circular(Dimensions.radius20(context))),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width15(context),
                            right: Dimensions.width100(context)),
                        child: _selectedVisitType == VisitType.newVisitor
                            ? newVisit()
                            : _selectedVisitType == VisitType.recurringVisitor
                                ? recurringVisitor()
                                : invitedVisitor(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.person,
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  newVisit() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.height50(context)),
              formField(
                "Full name",
                "*",
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: fullNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null; // Return null if the input is valid
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Name",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.width10(context))),
                ),
              ),
              SizedBox(height: Dimensions.height20(context)),
              formField(
                "Email",
                "",
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null; // Return null if the input is valid
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.width10(context))),
                ),
              ),
              SizedBox(height: Dimensions.height20(context)),
              formField(
                "Mobile",
                "",
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: mobileController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a value';
                    }
                    return null; // Return null if the input is valid
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Mobile",
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(left: Dimensions.width10(context))),
                ),
              ),
              SizedBox(height: Dimensions.height20(context)),
              formField(
                "Department",
                "*",
                StreamBuilder<List<String>>(
                  stream: DatabaseServices().getDepartmentListStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return SmallText(text: "Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return SmallText(text: "NO departments Available");
                    } else {
                      return DropdownButton<String>(
                        value: selectedBranch,
                        onChanged: (newValue) {
                          setState(() {
                            selectedBranch = newValue!;
                          });
                        },
                        items: snapshot.data!.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        hint: SmallText(text: 'Select Department'),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: Dimensions.height20(context)),
              formField(
                "Host",
                "",
                StreamBuilder<List<String>>(
                  stream: selectedBranch != null
                      ? DatabaseServices()
                          .getStaffListStreamForDepartment(selectedBranch!)
                      : const Stream<List<String>>.empty(),
                  builder: (context, snapshot) {
                    print("snapshot Data: ${snapshot.data}");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (snapshot.data == null ||
                        snapshot.data!.isEmpty) {
                      return Text("No staff members available");
                    } else {
                      return DropdownButton<String>(
                        value: selectedHost,
                        onChanged: (newValue) {
                          setState(() {
                            selectedHost = newValue!;
                          });
                        },
                        items: snapshot.data!.map((valueItem) {
                          return DropdownMenuItem<String>(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        hint: SmallText(text: 'Select Host'),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: Dimensions.height20(context)),
              formField(
                  "Purpose ",
                  "",
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: purposeController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null; // Return null if the input is valid
                    },
                    decoration: InputDecoration(
                        hintText: "Visiting reason",
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.only(left: Dimensions.width10(context))),
                  )),
              SizedBox(height: Dimensions.height30(context)),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: Dimensions.height20(context)),
                  child: Container(
                    //  margin: EdgeInsets.only(left: 200),
                    alignment: Alignment.center,
                    height: Dimensions.height40(context),
                    width: Dimensions.width150(context),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                            Dimensions.radius8(context))),
                    child: ElevatedButton(
                      onPressed: () async{
                        addVisitor();
                      },
                      child: BigText(
                        text: "ADD NEW",
                        color: Colors.white,
                        size: Dimensions.font14(context),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 20),
        Container(
          margin: EdgeInsets.only(top: 30, left: 30),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFF7F1F1),
                radius: 150,
                child: image != null
                    ? Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: Dimensions.height50(context),
                      ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //pickImage();
                },
                child: Container(
                    //  margin: EdgeInsets.only(left: 200),
                    alignment: Alignment.center,
                    height: Dimensions.height40(context),
                    width: Dimensions.width100(context),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius8(context))),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }

  recurringVisitor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SmallText(text: "Recurring Visitor Check-in"),
        ),
        SizedBox(height: Dimensions.height20(context)),

        formField(
          "Branch",
          "*",
          DropdownButton<String>(
            value: selectedBranch,
            onChanged: (newValue) {
              setState(() {
                selectedBranch = newValue!;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
            hint: SmallText(text: 'Select Branch'),
          ),
        ),

        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Email",
          "*",
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Email",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: Dimensions.width10(context))),
          ),
        ),
        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Phone Number",
          "*",
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: "Enter Mobile",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: Dimensions.width10(context))),
          ),
        ),

        SizedBox(height: Dimensions.height20(context)),

        //SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(bottom: Dimensions.height15(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  //  margin: EdgeInsets.only(left: 200),
                  alignment: Alignment.center,
                  height: Dimensions.height40(context),
                  width: Dimensions.width130(context),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius8(context))),
                  child: BigText(
                    text: "CANCEL",
                    color: Colors.black,
                    size: 14,
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  //  margin: EdgeInsets.only(left: 200),
                  alignment: Alignment.center,
                  height: Dimensions.height40(context),
                  width: Dimensions.width130(context),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius8(context))),
                  child: BigText(
                    text: "REQUEST OTP",
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  invitedVisitor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(Dimensions.height20(context)),
          child: SmallText(text: "Invited Visitor Check"),
        ),
        SizedBox(height: Dimensions.height20(context)),

        formField(
          "Branch",
          "*",
          DropdownButton<String>(
            value: selectedBranch,
            onChanged: (newValue) {
              setState(() {
                selectedBranch = newValue!;
              });
            },
            items: listItem.map((valueItem) {
              return DropdownMenuItem<String>(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
            hint: SmallText(text: 'Select Branch'),
          ),
        ),

        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Invite ID",
          "*",
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Enter Invite Id",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: Dimensions.width10(context))),
          ),
        ),

        SizedBox(height: Dimensions.height20(context)),

        //SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                //  margin: EdgeInsets.only(left: 200),
                alignment: Alignment.center,
                height: Dimensions.height40(context),
                width: Dimensions.width200(context),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius8(context))),
                child: BigText(
                  text: "CANCEL",
                  color: Colors.black,
                  size: 14,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {},
              child: Container(
                //  margin: EdgeInsets.only(left: 200),
                alignment: Alignment.center,
                height: Dimensions.height40(context),
                width: Dimensions.width200(context),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius8(context))),
                child: BigText(
                  text: "REQUEST OTP",
                  color: Colors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  formField(String labelText, String required, Widget child) {
    return Row(
      children: [
        Container(
          width: Dimensions.width130(context),
          child: Row(
            children: [
              SmallText(text: labelText),
              SmallText(
                text: required,
                color: Colors.red,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Dimensions.width50(context),
        ),
        Expanded(
          child: Container(
              width: double.infinity,
              height: Dimensions.height50(context),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(
                  Dimensions.radius10(context),
                ),
              ),
              child: child),
        )
      ],
    );
  }

 Future<void> addVisitor() async {
    if (_formKey.currentState!.validate()) {
      // All fields are valid, proceed to save data
      setState(() {
        _isLoading = true;
      });
      // Save visitor data to Firestore
      try {
         String visitorId = randomAlphaNumeric(10);
      Map<String, dynamic> visitorInfoMap = {
        "FullName": fullNameController.text,
        "Email": emailController.text,
        "Mobile": mobileController.text,
        "Department": selectedBranch!,
        "Host": selectedHost!,
        "Purpose": purposeController.text,
        "VisitorId": visitorId,
      };
      await DatabaseServices(uid: visitorId).addVisitorsDetails(visitorInfoMap);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Visitor data has been saved successfully.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  nextScreenReplace(context, HomePage());
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );      
      } catch (error) {
         print("Error saving visitor data: $error");
      
      }finally{
          // Regardless of success or failure, set loading state to false
      setState(() {
        _isLoading = false;
      });
    
      }
     

    }
  }

}
