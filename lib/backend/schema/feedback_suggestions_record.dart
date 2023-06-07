import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackSuggestionsRecord extends FirestoreRecord {
  FeedbackSuggestionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "date_time" field.
  String? _dateTime;
  String get dateTime => _dateTime ?? '';
  bool hasDateTime() => _dateTime != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _category = snapshotData['category'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _dateTime = snapshotData['date_time'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback_suggestions');

  static Stream<FeedbackSuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackSuggestionsRecord.fromSnapshot(s));

  static Future<FeedbackSuggestionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeedbackSuggestionsRecord.fromSnapshot(s));

  static FeedbackSuggestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackSuggestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackSuggestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackSuggestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackSuggestionsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createFeedbackSuggestionsRecordData({
  String? message,
  String? category,
  String? userId,
  String? dateTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'category': category,
      'user_id': userId,
      'date_time': dateTime,
    }.withoutNulls,
  );

  return firestoreData;
}
