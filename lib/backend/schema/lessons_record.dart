import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonsRecord extends FirestoreRecord {
  LessonsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "completed" field.
  bool? _completed;
  bool get completed => _completed ?? false;
  bool hasCompleted() => _completed != null;

  // "videourl" field.
  String? _videourl;
  String get videourl => _videourl ?? '';
  bool hasVideourl() => _videourl != null;

  // "Topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "pdfFile" field.
  String? _pdfFile;
  String get pdfFile => _pdfFile ?? '';
  bool hasPdfFile() => _pdfFile != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _completed = snapshotData['completed'] as bool?;
    _videourl = snapshotData['videourl'] as String?;
    _topic = snapshotData['Topic'] as String?;
    _image = snapshotData['image'] as String?;
    _pdfFile = snapshotData['pdfFile'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lessons')
          : FirebaseFirestore.instance.collectionGroup('lessons');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lessons').doc(id);

  static Stream<LessonsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonsRecord.fromSnapshot(s));

  static Future<LessonsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonsRecord.fromSnapshot(s));

  static LessonsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LessonsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonsRecordData({
  bool? completed,
  String? videourl,
  String? topic,
  String? image,
  String? pdfFile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'completed': completed,
      'videourl': videourl,
      'Topic': topic,
      'image': image,
      'pdfFile': pdfFile,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonsRecordDocumentEquality implements Equality<LessonsRecord> {
  const LessonsRecordDocumentEquality();

  @override
  bool equals(LessonsRecord? e1, LessonsRecord? e2) {
    return e1?.completed == e2?.completed &&
        e1?.videourl == e2?.videourl &&
        e1?.topic == e2?.topic &&
        e1?.image == e2?.image &&
        e1?.pdfFile == e2?.pdfFile;
  }

  @override
  int hash(LessonsRecord? e) => const ListEquality()
      .hash([e?.completed, e?.videourl, e?.topic, e?.image, e?.pdfFile]);

  @override
  bool isValidKey(Object? o) => o is LessonsRecord;
}
