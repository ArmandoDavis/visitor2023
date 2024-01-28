import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  // Referencing to our collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("staffs");
  final CollectionReference departmentMembersCollection =
      FirebaseFirestore.instance.collection("departmentMembers");

  Future savingUserData(String fullName, String email) async {
    return await userCollection
        .doc(uid)
        .set({"fullName": fullName, "email": email, "uid": uid});
  }

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  // Creating department data
  Future createDepartmentDetails(
      Map<String, dynamic> departmentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("departments") // Change to "departments"
        .doc(id)
        .set(departmentInfoMap);
  }

  // Getting department data
  Stream<QuerySnapshot> getDepartmentDetails() {
    return FirebaseFirestore.instance.collection("departments").snapshots();
  }

  // Creating staff data
  Future addStaffToDepartment(Map<String, dynamic> staffInfoMap) async {
    return await departmentMembersCollection.doc(staffInfoMap["id"]).set(staffInfoMap);
  }

  // Getting staff details from each department
  Stream<QuerySnapshot> getStaffDetailsForDepartment(String departmentId) {
    return departmentMembersCollection
        .where("DepartmentId", isEqualTo: departmentId)
        .snapshots();
  }

  Future<int> getStaffCountForDepartment(String departmentId) async {
    QuerySnapshot snapshot = await departmentMembersCollection
        .where("DepartmentId", isEqualTo: departmentId)
        .get();

    return snapshot.size;
  }

  Future addVisitorsDetails(Map<String, dynamic> visitorsInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("visitors")
        .doc(uid)
        .set(visitorsInfoMap);
  }

  Stream<List<String>> getDepartmentListStream() {
    return FirebaseFirestore.instance
        .collection("departments")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => doc["Name"].toString()).toList();
    });
  }

  Stream<List<String>> getStaffListStreamForDepartment(String departmentId) {
    return departmentMembersCollection
        .where("DepartmentId", isEqualTo: departmentId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc['Name'].toString()).toList());
  }
}
