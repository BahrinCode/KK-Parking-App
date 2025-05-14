// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ParkingBoxStruct extends FFFirebaseStruct {
  ParkingBoxStruct({
    double? rate,
    double? hour,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rate = rate,
        _hour = hour,
        super(firestoreUtilData);

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;

  void incrementRate(double amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "hour" field.
  double? _hour;
  double get hour => _hour ?? 0.0;
  set hour(double? val) => _hour = val;

  void incrementHour(double amount) => hour = hour + amount;

  bool hasHour() => _hour != null;

  static ParkingBoxStruct fromMap(Map<String, dynamic> data) =>
      ParkingBoxStruct(
        rate: castToType<double>(data['rate']),
        hour: castToType<double>(data['hour']),
      );

  static ParkingBoxStruct? maybeFromMap(dynamic data) => data is Map
      ? ParkingBoxStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rate': _rate,
        'hour': _hour,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'hour': serializeParam(
          _hour,
          ParamType.double,
        ),
      }.withoutNulls;

  static ParkingBoxStruct fromSerializableMap(Map<String, dynamic> data) =>
      ParkingBoxStruct(
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        hour: deserializeParam(
          data['hour'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ParkingBoxStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ParkingBoxStruct &&
        rate == other.rate &&
        hour == other.hour;
  }

  @override
  int get hashCode => const ListEquality().hash([rate, hour]);
}

ParkingBoxStruct createParkingBoxStruct({
  double? rate,
  double? hour,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ParkingBoxStruct(
      rate: rate,
      hour: hour,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ParkingBoxStruct? updateParkingBoxStruct(
  ParkingBoxStruct? parkingBox, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    parkingBox
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addParkingBoxStructData(
  Map<String, dynamic> firestoreData,
  ParkingBoxStruct? parkingBox,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (parkingBox == null) {
    return;
  }
  if (parkingBox.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && parkingBox.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final parkingBoxData = getParkingBoxFirestoreData(parkingBox, forFieldValue);
  final nestedData = parkingBoxData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = parkingBox.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getParkingBoxFirestoreData(
  ParkingBoxStruct? parkingBox, [
  bool forFieldValue = false,
]) {
  if (parkingBox == null) {
    return {};
  }
  final firestoreData = mapToFirestore(parkingBox.toMap());

  // Add any Firestore field values
  parkingBox.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getParkingBoxListFirestoreData(
  List<ParkingBoxStruct>? parkingBoxs,
) =>
    parkingBoxs?.map((e) => getParkingBoxFirestoreData(e, true)).toList() ?? [];
