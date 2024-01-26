import 'package:flutter/material.dart';
import 'package:visitors2023/widget/big_text.dart';
import 'package:visitors2023/widget/small_text.dart';
import 'package:visitors2023/widget/utils/dimensions.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Dimensions.height700(context),
        padding:  EdgeInsets.all(Dimensions.height50(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Adjust as needed
                children: [
                   Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Check Out the visitor',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Dimensions.font20(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
            ),
             SizedBox(height: Dimensions.height20(context)),
             SmallText(text: "Enter VisitorId to checkout visitor:"),
             SizedBox(height: Dimensions.height15(context)),
            Container(
              width: Dimensions.width700(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height5(context)), border: Border.all()),
              child:  Padding(
                padding: EdgeInsets.only(left: Dimensions.width20(context)),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Visitor ID',
                     labelStyle: TextStyle(
                      color: Colors.green
                     ),
                    enabledBorder: UnderlineInputBorder(
                      
                      borderSide: BorderSide.none
                           // Color for the border when not focused
                    ),
                    focusedBorder:
                        InputBorder.none, // Remove the underline when focused
                  ),
                  style: TextStyle(
                      color: Colors.green), // Color for the input text
                ),
              ),
            ),
     SizedBox(height: Dimensions.height10(context)),
             BigText(text: "OR",size: Dimensions.font14(context),),
             SizedBox(height: Dimensions.height20(context)),
             SmallText(text: "Enter InviteId to checkOut visitor"),
             SizedBox(height: Dimensions.height15(context)),
            Container(
              width: Dimensions.width700(context),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height5(context)), border: Border.all()),
              child: Padding(
                padding:  EdgeInsets.only(left:Dimensions.width20(context)),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Invited ID',
                    labelStyle: TextStyle(
                        color: Colors.green
                       ),
                      enabledBorder: UnderlineInputBorder(
                        
                        borderSide: BorderSide.none
                             // Color for the border when not focused
                      ),
                      focusedBorder:
                          InputBorder.none, 
                  ),
                  style: TextStyle(
                        color: Colors.green),
                ),
              ),
            ),
             SizedBox(height: Dimensions.height10(context)),
             BigText(text: "OR",size: Dimensions.font14(context),),
             SizedBox(height: Dimensions.height20(context)),
             SmallText(text: "Search by Visitors name for checkout"),
             SizedBox(height: Dimensions.height15(context)),
            Container(
              width: Dimensions.width700(context),
             
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.height5(context)), border: Border.all()),
              child: Padding(
                padding:  EdgeInsets.only(left:Dimensions.width20(context)),
                child: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                    labelStyle: TextStyle(
                        color: Colors.green
                       ),
                      enabledBorder: UnderlineInputBorder(
                        
                        borderSide: BorderSide.none
                             // Color for the border when not focused
                      ),
                      focusedBorder:
                          InputBorder.none, // Remove the underline when focused
                    ),
                    style: TextStyle(
                        color: Colors.green),
                  ),
              ),
              ),
            
             SizedBox(height: Dimensions.height20(context)),
            Padding(
              padding:  EdgeInsets.only(right: Dimensions.width50(context), top: Dimensions.height10(context)),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: Dimensions.width100(context),
                  height: Dimensions.height40(context),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      // Perform the search action here
                    },
                    child:  SmallText(text: 'Search'),
                  ),
                ),
              ),
            ),
             SizedBox(height: Dimensions.height10(context)),
            Container(
              width: Dimensions.width100(context),
              height: Dimensions.height40(context),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text(
                  'Close',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
