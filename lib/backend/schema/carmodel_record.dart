import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarmodelRecord extends FirestoreRecord {
  CarmodelRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
    _model = snapshotData['model'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('carmodel');

  static Stream<CarmodelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarmodelRecord.fromSnapshot(s));

  static Future<CarmodelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarmodelRecord.fromSnapshot(s));

  static CarmodelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CarmodelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarmodelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarmodelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarmodelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarmodelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarmodelRecordData({
  int? id,
  String? model,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'model': model,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarmodelRecordDocumentEquality implements Equality<CarmodelRecord> {
  const CarmodelRecordDocumentEquality();

  @override
  bool equals(CarmodelRecord? e1, CarmodelRecord? e2) {
    return e1?.id == e2?.id && e1?.model == e2?.model;
  }

  @override
  int hash(CarmodelRecord? e) => const ListEquality().hash([e?.id, e?.model]);

  @override
  bool isValidKey(Object? o) => o is CarmodelRecord;
}
