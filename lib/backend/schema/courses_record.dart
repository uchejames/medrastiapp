import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  bool hasThumbnail() => _thumbnail != null;

  // "Category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "numberofEnroledstudents" field.
  int? _numberofEnroledstudents;
  int get numberofEnroledstudents => _numberofEnroledstudents ?? 0;
  bool hasNumberofEnroledstudents() => _numberofEnroledstudents != null;

  // "Classe" field.
  String? _classe;
  String get classe => _classe ?? '';
  bool hasClasse() => _classe != null;

  // "Categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "Price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "lesson" field.
  DocumentReference? _lesson;
  DocumentReference? get lesson => _lesson;
  bool hasLesson() => _lesson != null;

  // "courseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "courseContentsList" field.
  List<String>? _courseContentsList;
  List<String> get courseContentsList => _courseContentsList ?? const [];
  bool hasCourseContentsList() => _courseContentsList != null;

  void _initializeFields() {
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _thumbnail = snapshotData['Thumbnail'] as String?;
    _category = getDataList(snapshotData['Category']);
    _numberofEnroledstudents =
        castToType<int>(snapshotData['numberofEnroledstudents']);
    _classe = snapshotData['Classe'] as String?;
    _categories = snapshotData['Categories'] as String?;
    _price = snapshotData['Price'] as String?;
    _video = snapshotData['video'] as String?;
    _lesson = snapshotData['lesson'] as DocumentReference?;
    _courseRef = snapshotData['courseRef'] as DocumentReference?;
    _courseContentsList = getDataList(snapshotData['courseContentsList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? title,
  String? description,
  String? thumbnail,
  int? numberofEnroledstudents,
  String? classe,
  String? categories,
  String? price,
  String? video,
  DocumentReference? lesson,
  DocumentReference? courseRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Title': title,
      'Description': description,
      'Thumbnail': thumbnail,
      'numberofEnroledstudents': numberofEnroledstudents,
      'Classe': classe,
      'Categories': categories,
      'Price': price,
      'video': video,
      'lesson': lesson,
      'courseRef': courseRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.thumbnail == e2?.thumbnail &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.numberofEnroledstudents == e2?.numberofEnroledstudents &&
        e1?.classe == e2?.classe &&
        e1?.categories == e2?.categories &&
        e1?.price == e2?.price &&
        e1?.video == e2?.video &&
        e1?.lesson == e2?.lesson &&
        e1?.courseRef == e2?.courseRef &&
        listEquality.equals(e1?.courseContentsList, e2?.courseContentsList);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.thumbnail,
        e?.category,
        e?.numberofEnroledstudents,
        e?.classe,
        e?.categories,
        e?.price,
        e?.video,
        e?.lesson,
        e?.courseRef,
        e?.courseContentsList
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
