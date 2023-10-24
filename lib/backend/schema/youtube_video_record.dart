import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class YoutubeVideoRecord extends FirestoreRecord {
  YoutubeVideoRecord._(
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
          ? parent.collection('youtubeVideo')
          : FirebaseFirestore.instance.collectionGroup('youtubeVideo');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('youtubeVideo').doc();

  static Stream<YoutubeVideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => YoutubeVideoRecord.fromSnapshot(s));

  static Future<YoutubeVideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => YoutubeVideoRecord.fromSnapshot(s));

  static YoutubeVideoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      YoutubeVideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static YoutubeVideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      YoutubeVideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'YoutubeVideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is YoutubeVideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createYoutubeVideoRecordData({
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

class YoutubeVideoRecordDocumentEquality
    implements Equality<YoutubeVideoRecord> {
  const YoutubeVideoRecordDocumentEquality();

  @override
  bool equals(YoutubeVideoRecord? e1, YoutubeVideoRecord? e2) {
    return e1?.title == e2?.title && e1?.url == e2?.url;
  }

  @override
  int hash(YoutubeVideoRecord? e) =>
      const ListEquality().hash([e?.title, e?.url]);

  @override
  bool isValidKey(Object? o) => o is YoutubeVideoRecord;
}
