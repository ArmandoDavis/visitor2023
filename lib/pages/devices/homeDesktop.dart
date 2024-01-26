import 'package:flutter/material.dart';
import 'package:visitors2023/helper/helperFunctions.dart';
import 'package:visitors2023/pages/devices/desktopAppbar.dart';
import 'package:visitors2023/screens/card_screen.dart';
import 'package:visitors2023/screens/visitors_list.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';



class HomeDesktop extends StatefulWidget {
  HomeDesktop({
    super.key,
  });

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
    String fullName = "";
  String email = "";


  @override
  void initState(){
    super.initState();
    gettingUserData();
  }

  gettingUserData()async{
    await HelperFunction.getUserEmailFromSF().then((value) {
      setState(() {
        email = value!;
      });
    });
    await HelperFunction.getUserNameFromSF().then((value) {
      setState(() {
        fullName = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.height15(context)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: Dimensions.height60(context),
                        padding:
                            EdgeInsets.only(left: Dimensions.width30(context)),
                        margin: EdgeInsets.only(
                            bottom: Dimensions.height10(context),
                            top: Dimensions.height10(context),
                            left: Dimensions.width10(context)),
                        color: Color(0xFFF7F3F3),
                        //Top Body
                        child: DesktopAppBar(
                          head: fullName,
                          
                        )),
                    Row(
                      children: List.generate(4, (index) {
                        // ignore: unnecessary_string_escapes
                        return  CardContainer(
                          color: Colors.yellow,
                          title: "Today\s Check in",
                          number: 2,
                        );
                      }),
                    ),
                    SizedBox(height: Dimensions.height20(context)),
                    Container(
                      //margin: EdgeInsets.only(left: 10, right: 20),
                      width: double.infinity,
                      height: Dimensions.height200(context),
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.width10(context),
                            top: Dimensions.height20(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: "On Premises visitors(0)"),
                            Divider(
                              color: grey,
                            ),
                            SizedBox(height: Dimensions.height20(context)),
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.height20(context),
                                  bottom: Dimensions.height10(context),
                                  left: Dimensions.width30(context)),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius8(context))),
                              child: Row(
                                children: [
                                  Row(
                                    children: List.generate(4, (index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Dimensions.width30(context)),
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Color(0xFFF7F1F1),
                                              radius:
                                                  Dimensions.radius25(context),
                                              child: Icon(
                                                Icons.person,
                                                color: Colors.grey,
                                                size: Dimensions.height30(
                                                    context),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  Dimensions.height5(context),
                                            ),
                                            SmallText(text: "Visitor 1")
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(width: Dimensions.width50(context)),
                                  Expanded(
                                    child: SmallText(text:
                                        "Today's checked-in visitors will be shown here"),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20(context)),
                    Row(
                      children: [
                        VisitorsList(
                          heading: "Expected Visitors  (0)",
                          title: "Visitor 1",
                          host: "Department",
                          purpose: "Purpose",
                        ),
                        SizedBox(width: Dimensions.width10(context)),
                        VisitorsList(
                            title: "Visitor 1",
                            host: "Department",
                            purpose: "Purpose",
                            heading: "Pending Host Approval")
                      ],
                    ),
                    //For The checkins
                    SizedBox(height: Dimensions.height20(context)),
                    Row(
                      children: [
                        VisitorsList(
                          heading: "Recent Checkins",
                          title: "Visitor 1",
                          host: "Department",
                          purpose: "Purpose",
                        ),
                        SizedBox(width: Dimensions.width10(context)),
                        VisitorsList(
                            title: "Visitor 1",
                            host: "Department",
                            purpose: "Purpose",
                            heading: "Recent CheckOut")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.person,
          color: grey,
        ),
        backgroundColor: white,
      ),
    );
  }
}
