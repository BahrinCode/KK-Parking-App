// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleStruct extends FFFirebaseStruct {
  RoleStruct({
    String? userID,
    String? role,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userID = userID,
        _role = role,
        super(firestoreUtilData);

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;

  bool hasUserID() => _userID != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static RoleStruct fromMap(Map<String, dynamic> data) => RoleStruct(
        userID: data['userID'] as String?,
        role: data['Role'] as String?,
      );

  static RoleStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'userID': _userID,
        'Role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'Role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoleStruct(
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['Role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoleStruct && userID == other.userID && role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([userID, role]);
}

RoleStruct createRoleStruct({
  String? userID,
  String? role,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoleStruct(
      userID: userID,
      role: role,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoleStruct? updateRoleStruct(
  RoleStruct? roleStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    roleStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoleStructData(
  Map<String, dynamic> firestoreData,
  RoleStruct? roleStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (roleStruct == null) {
    return;
  }
  if (roleStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && roleStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roleStructData = getRoleFirestoreData(roleStruct, forFieldValue);
  final nestedData = roleStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = roleStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoleFirestoreData(
  RoleStruct? roleStruct, [
  bool forFieldValue = false,
]) {
  if (roleStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(roleStruct.toMap());

  // Add any Firestore field values
  roleStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoleListFirestoreData(
  List<RoleStruct>? roleStructs,
) =>
    roleStructs?.map((e) => getRoleFirestoreData(e, true)).toList() ?? [];
