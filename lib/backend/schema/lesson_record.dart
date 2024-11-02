import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonRecord extends FirestoreRecord {
  LessonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "content_link" field.
  String? _contentLink;
  String get contentLink => _contentLink ?? '';
  bool hasContentLink() => _contentLink != null;

  // "access_type" field.
  String? _accessType;
  String get accessType => _accessType ?? '';
  bool hasAccessType() => _accessType != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "lessoncontent" field.
  DocumentReference? _lessoncontent;
  DocumentReference? get lessoncontent => _lessoncontent;
  bool hasLessoncontent() => _lessoncontent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _type = snapshotData['type'] as String?;
    _thumbnail = snapshotData['thumbnail'] as String?;
    _contentLink = snapshotData['content_link'] as String?;
    _accessType = snapshotData['access_type'] as String?;
    _price = castToType<int>(snapshotData['Price']);
    _lessoncontent = snapshotData['lessoncontent'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lesson')
          : FirebaseFirestore.instance.collectionGroup('lesson');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lesson').doc(id);

  static Stream<LessonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LessonRecord.fromSnapshot(s));

  static Future<LessonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LessonRecord.fromSnapshot(s));

  static LessonRecord fromSnapshot(DocumentSnapshot snapshot) => LessonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LessonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LessonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LessonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LessonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLessonRecordData({
  String? title,
  String? type,
  String? thumbnail,
  String? contentLink,
  String? accessType,
  int? price,
  DocumentReference? lessoncontent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'type': type,
      'thumbnail': thumbnail,
      'content_link': contentLink,
      'access_type': accessType,
      'Price': price,
      'lessoncontent': lessoncontent,
    }.withoutNulls,
  );

  return firestoreData;
}

class LessonRecordDocumentEquality implements Equality<LessonRecord> {
  const LessonRecordDocumentEquality();

  @override
  bool equals(LessonRecord? e1, LessonRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.type == e2?.type &&
        e1?.thumbnail == e2?.thumbnail &&
        e1?.contentLink == e2?.contentLink &&
        e1?.accessType == e2?.accessType &&
        e1?.price == e2?.price &&
        e1?.lessoncontent == e2?.lessoncontent;
  }

  @override
  int hash(LessonRecord? e) => const ListEquality().hash([
        e?.title,
        e?.type,
        e?.thumbnail,
        e?.contentLink,
        e?.accessType,
        e?.price,
        e?.lessoncontent
      ]);

  @override
  bool isValidKey(Object? o) => o is LessonRecord;
}
