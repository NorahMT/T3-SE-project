import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentRecord extends FirestoreRecord {
  DocumentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('document')
          : FirebaseFirestore.instance.collectionGroup('document');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('document').doc();

  static Stream<DocumentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentRecord.fromSnapshot(s));

  static Future<DocumentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentRecord.fromSnapshot(s));

  static DocumentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentRecordData({
  String? title,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentRecordDocumentEquality implements Equality<DocumentRecord> {
  const DocumentRecordDocumentEquality();

  @override
  bool equals(DocumentRecord? e1, DocumentRecord? e2) {
    return e1?.title == e2?.title && e1?.url == e2?.url;
  }

  @override
  int hash(DocumentRecord? e) => const ListEquality().hash([e?.title, e?.url]);

  @override
  bool isValidKey(Object? o) => o is DocumentRecord;
}
