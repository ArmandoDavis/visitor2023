import 'package:flutter/material.dart';
import 'package:visitors2023/pages/devices/desktopAppbar.dart';
import 'package:visitors2023/pages/home/homepage.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';
import 'package:visitors2023/widget/widget.dart';


import '../../screens/dashboard_screen.dart';
import '../../screens/settings_screen.dart';
import '../../screens/visitors_screen.dart';
import 'homeDesktop.dart';
enum VisitType {
  singleInvite,
  bulkInvite,
}
class InvitedVisitors extends StatefulWidget {
  const InvitedVisitors({super.key});

  @override
  State<InvitedVisitors> createState() => _InvitedVisitorsState();
}

class _InvitedVisitorsState extends State<InvitedVisitors> {
  final List<Widget> _screens = [
    HomeDesktop(),
    DashboardScreen(),
    VisitorsScreen(),
    SettingsScreen()
  ];

  int _selectedIndex = 0;
  int _lastSelectedIndex = 0;
  VisitType _selectedVisitType= VisitType.singleInvite;

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration());

  String? selectedBranch;
  List<String> listItem = ["Branch 1", "Branch 2", "Branch 3", "Branch 4"];

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(

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
                  Expanded(child: DesktopAppBar(head: "Invite Visitor")),
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
                              _selectedVisitType = VisitType.singleInvite;
                              });
                            },
                            child:_selectedVisitType == VisitType.singleInvite? BigText(text: "Single Invite"):SmallText(text: "Single Invite"),
                          ),
                          SizedBox(width: Dimensions.width20(context)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedVisitType = VisitType.bulkInvite;
                              });
                            },
                            child: _selectedVisitType == VisitType.bulkInvite? BigText(text: "Bulk Invite"):SmallText(text: "Bulk Invite"),
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
                            right: Dimensions.width200(context)),
                        child:
                            _selectedVisitType == VisitType.singleInvite ? singleInvite() : bulkInvite(),
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

  singleInvite() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height20(context),
              left: Dimensions.width10(context),
              bottom: Dimensions.height10(context)),
          child: BigText(
            text:
            "Single Invite",
           size: Dimensions.font20(context),
          ),
        ),
        SizedBox(height: Dimensions.height10(context)),
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
            hint: Text('Select Branch'),
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
        formField(
          "Full name",
          "*",
          TextFormField(
            keyboardType: TextInputType.name,
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
        (buildDateRangeRow(startDate, endDate)),
        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Maximum Checkin",
          "",
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Maximum Checkins",
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: Dimensions.width10(context))),
          ),
        ),
        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Purpose ",
          "",
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
                child: SmallText(text:valueItem),
              );
            }).toList(),
            hint: SmallText(text: 'Select Branch'),
          ),
        ),
        SizedBox(height: Dimensions.height20(context)),
        formField(
          "Host",
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
        SizedBox(height: Dimensions.height30(context)),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
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
              child: BigText(text:
                "INVITE VISITOR",
                size: Dimensions.font14(context),
               color: Colors.white,
              ),
            ),
          ),
        )
      
      ],
    );
  }

  bulkInvite() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Dimensions.height20(context),
              left: Dimensions.width10(context),
              bottom: Dimensions.height10(context)),
          child: BigText(text:
            "Bulk Invite",
            size: Dimensions.font24(context), ),
          ),
        
        SizedBox(height: Dimensions.height10(context)),
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
        SizedBox(height:  Dimensions.height20(context)),
        (buildDateRangeRow(startDate, endDate)),
        SizedBox(height:  Dimensions.height20(context)),
        formField(
          "Maximum Checkin",
          "",
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                hintText: "Maximum Checkins",
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left:  Dimensions.width10(context))),
          ),
        ),
        SizedBox(height:  Dimensions.height20(context)),
        formField(
          "Purpose ",
          "",
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
        SizedBox(height:  Dimensions.height20(context)),
        formField(
          "Host",
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
        SizedBox(height:  Dimensions.height20(context)),
        Row(
          children: [
            Container(
              width:  Dimensions.width130(context),
              child: Row(
                children: [
                  SmallText(text: "Choose File"),
                  SmallText(text:
                    "*",
                   color: Colors.red
                  ),
                ],
              ),
            ),
            SizedBox(width: Dimensions.width50(context)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    //  margin: EdgeInsets.only(left: 200),
                    alignment: Alignment.center,
                    height: Dimensions.height40(context),
                    width: Dimensions.width150(context),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(Dimensions.radius8(context))),
                    child: SmallText(text:
                      "Choose File",
                     color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: Dimensions.width10(context)),
                SmallText(text:
                  "Download The Sample File",
                 color: Colors.blue
                )
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.height20(context)),
        SmallText(text:
          "*Maximum Limit 100 records",
         color: Colors.red, size: Dimensions.font14(context)
        ),
        //SizedBox(height: 30),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(bottom: Dimensions.height100(context)),
              alignment: Alignment.center,
              height: Dimensions.height40(context),
              width: Dimensions.width200(context),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(Dimensions.radius8(context))),
              child: BigText(text:
                "INVITE VISITORS",
                color: Colors.white,
                size: Dimensions.font14(context),
              ),
            ),
          ),
        )
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
              SmallText(text:labelText),
              SmallText(text:
                required,
               color: Colors.red,
              ),
            ],
          ),
        ),
        SizedBox(width:  Dimensions.width50(context),),
        Expanded(
          child: Container(
              width: double.infinity,
              height:  Dimensions.height50(context),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular( Dimensions.radius10(context),),
              ),
              child: child),
        )
      ],
    );
  }

  buildDateRangeRow(DateTime startDate, DateTime endDate) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width:  Dimensions.width130(context),
          child: Row(
            children: [
              SmallText(text: "Active from"),
              SmallText(text:
                "*",
                color: Colors.red
              ),
            ],
          ),
        ),
        SizedBox(width:  Dimensions.width50(context),),
        Expanded(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width:  Dimensions.width300(context),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular( Dimensions.radius10(context),),
                          ),
                          padding: EdgeInsets.symmetric(horizontal:  Dimensions.width10(context),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "${startDate.toLocal()}".split(' ')[0]),
                              SmallText(text: "${endDate.hour}:${endDate.minute}"),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: startDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (selectedDate != null &&
                                      selectedDate != startDate) {
                                    setState(() {
                                      startDate = selectedDate;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width:  Dimensions.width10(context),),
                        SmallText(text: "to",size: Dimensions.font18(context),),
                        SizedBox(width:  Dimensions.width10(context),),
                        Container(
                          width:  Dimensions.width300(context),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular( Dimensions.radius10(context),),
                          ),
                          padding: EdgeInsets.symmetric(horizontal:  Dimensions.width10(context),),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(text: "${endDate.toLocal()}".split(' ')[0]),
                              SmallText(text: "${endDate.hour}:${endDate.minute}"),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: endDate,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2101),
                                  );
                                  if (selectedDate != null) {
                                    TimeOfDay? selectedTime =
                                        await showTimePicker(
                                      context: context,
                                      initialTime:
                                          TimeOfDay.fromDateTime(endDate),
                                    );
                                    if (selectedTime != null) {
                                      setState(() {
                                        endDate = DateTime(
                                          selectedDate.year,
                                          selectedDate.month,
                                          selectedDate.day,
                                          selectedTime.hour,
                                          selectedTime.minute,
                                        );
                                      });
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
