import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "answers" field.
  List<String>? _answers;
  List<String> get answers => _answers ?? const [];
  bool hasAnswers() => _answers != null;

  // "correctAnswerIndex" field.
  int? _correctAnswerIndex;
  int get correctAnswerIndex => _correctAnswerIndex ?? 0;
  bool hasCorrectAnswerIndex() => _correctAnswerIndex != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _answers = getDataList(snapshotData['answers']);
    _correctAnswerIndex = castToType<int>(snapshotData['correctAnswerIndex']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quiz')
          : FirebaseFirestore.instance.collectionGroup('quiz');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('quiz').doc();

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  String? question,
  int? correctAnswerIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'correctAnswerIndex': correctAnswerIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.question == e2?.question &&
        listEquality.equals(e1?.answers, e2?.answers) &&
        e1?.correctAnswerIndex == e2?.correctAnswerIndex;
  }

  @override
  int hash(QuizRecord? e) => const ListEquality()
      .hash([e?.question, e?.answers, e?.correctAnswerIndex]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
