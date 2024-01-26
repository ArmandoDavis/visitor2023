import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  //referencing to our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("staffs");

  Future savingUserData(String fullName, String email) async {
    return await userCollection
        .doc(uid)
        .set({"fullName": fullName, "email": email, "uid": uid});
  }

  //Getting Staff Data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  //creating department data
  Future createDepartmentDetails(
      Map<String, dynamic> departmentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("department")
        .doc(id)
        .set(departmentInfoMap);
  }

  //Getting department data
  Stream<QuerySnapshot> getDepartmentDetails() {
    return FirebaseFirestore.instance.collection("department").snapshots();
  }

  //Creating staff data
  Future addStaffToDepartment(Map<String, dynamic> staffInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("department")
        .doc(staffInfoMap["DepartmentId"])
        .collection("staff")
        .doc(staffInfoMap["Id"])
        .set(staffInfoMap);
  }

  //Getting staff details from each department
  Stream<QuerySnapshot> getStaffDetailsForDepartment(String departmentId) {
    return FirebaseFirestore.instance
        .collection("department")
        .doc(departmentId)
        .collection("staff")
        .snapshots();
  }

  // New method to get the count of staff members in a department
  Future<int> getStaffCountForDepartment(String departmentId) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("department")
        .doc(departmentId)
        .collection("staff")
        .get();

    return snapshot.size;
  }

  //creating visitors data
  Future addVisitorsDetails(Map<String, dynamic> visitorsInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("visitors")
        .doc(uid)
        .set(visitorsInfoMap);
  }

  //Fetching the list of departments
  // Future<List<String>> getDepartmentList() async {
  //   QuerySnapshot snapshot =
  //       await FirebaseFirestore.instance.collection("department").get();
  //   List<String> departmentList = [];
  //   snapshot.docs.forEach((doc) {
  //     departmentList.add(doc["Name"]);
  //   });
  //   return departmentList;
  // }
  Stream<List<String>> getDepartmentListStream() {
    return FirebaseFirestore.instance.collection("department").snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc["Name"].toString()).toList();
      },
    );
  }

  //Fetching the list of staff in a particular department

  Stream<List<String>> getStaffListStreamForDepartment(String departmentId) {
  return DatabaseServices()
      .getStaffDetailsForDepartment(departmentId)
      .map((snapshot) => snapshot.docs.map((doc) => doc['Name'].toString()).toList());
}

}
