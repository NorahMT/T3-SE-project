import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "publishedDate" field.
  DateTime? _publishedDate;
  DateTime? get publishedDate => _publishedDate;
  bool hasPublishedDate() => _publishedDate != null;

  // "progressPercentage" field.
  double? _progressPercentage;
  double get progressPercentage => _progressPercentage ?? 0.0;
  bool hasProgressPercentage() => _progressPercentage != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _publishedDate = snapshotData['publishedDate'] as DateTime?;
    _progressPercentage =
        castToType<double>(snapshotData['progressPercentage']);
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
  String? name,
  String? description,
  DateTime? publishedDate,
  double? progressPercentage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'publishedDate': publishedDate,
      'progressPercentage': progressPercentage,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.publishedDate == e2?.publishedDate &&
        e1?.progressPercentage == e2?.progressPercentage;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality()
      .hash([e?.name, e?.description, e?.publishedDate, e?.progressPercentage]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
