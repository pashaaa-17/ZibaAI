import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceDirectoryRecord extends FirestoreRecord {
  ServiceDirectoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "contact_number" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _contactNumber = snapshotData['contact_number'] as String?;
    _website = snapshotData['website'] as String?;
    _description = snapshotData['description'] as String?;
    _address = snapshotData['address'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service_directory');

  static Stream<ServiceDirectoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceDirectoryRecord.fromSnapshot(s));

  static Future<ServiceDirectoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServiceDirectoryRecord.fromSnapshot(s));

  static ServiceDirectoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceDirectoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceDirectoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceDirectoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceDirectoryRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createServiceDirectoryRecordData({
  String? name,
  String? contactNumber,
  String? website,
  String? description,
  String? address,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'contact_number': contactNumber,
      'website': website,
      'description': description,
      'address': address,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}
