import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StudentRecord extends FirestoreRecord {
  StudentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "student_id" field.
  String? _studentId;
  String get studentId => _studentId ?? '';
  bool hasStudentId() => _studentId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _studentId = snapshotData['student_id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('student')
          : FirebaseFirestore.instance.collectionGroup('student');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('student').doc(id);

  static Stream<StudentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StudentRecord.fromSnapshot(s));

  static Future<StudentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StudentRecord.fromSnapshot(s));

  static StudentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StudentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StudentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StudentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StudentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StudentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStudentRecordData({
  String? name,
  String? studentId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'student_id': studentId,
    }.withoutNulls,
  );

  return firestoreData;
}

class StudentRecordDocumentEquality implements Equality<StudentRecord> {
  const StudentRecordDocumentEquality();

  @override
  bool equals(StudentRecord? e1, StudentRecord? e2) {
    return e1?.name == e2?.name && e1?.studentId == e2?.studentId;
  }

  @override
  int hash(StudentRecord? e) =>
      const ListEquality().hash([e?.name, e?.studentId]);

  @override
  bool isValidKey(Object? o) => o is StudentRecord;
}
