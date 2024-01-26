import 'package:flutter/material.dart';
import 'package:visitors2023/widget/utils/colors.dart';
import 'package:visitors2023/widget/big_text.dart';

class VisitorsScreen extends StatefulWidget {
  const VisitorsScreen({super.key});

  @override
  State<VisitorsScreen> createState() => _VisitorsScreenState();
}

class _VisitorsScreenState extends State<VisitorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: BigText(text: "Visitors Screen"),
      ),
    );
  }
}