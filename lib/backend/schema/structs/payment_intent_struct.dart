// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentIntentStruct extends FFFirebaseStruct {
  PaymentIntentStruct({
    String? clientSecret,
    String? customerId,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _clientSecret = clientSecret,
        _customerId = customerId,
        _id = id,
        super(firestoreUtilData);

  // "clientSecret" field.
  String? _clientSecret;
  String get clientSecret => _clientSecret ?? '';
  set clientSecret(String? val) => _clientSecret = val;

  bool hasClientSecret() => _clientSecret != null;

  // "customerId" field.
  String? _customerId;
  String get customerId => _customerId ?? '';
  set customerId(String? val) => _customerId = val;

  bool hasCustomerId() => _customerId != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static PaymentIntentStruct fromMap(Map<String, dynamic> data) =>
      PaymentIntentStruct(
        clientSecret: data['clientSecret'] as String?,
        customerId: data['customerId'] as String?,
        id: data['id'] as String?,
      );

  static PaymentIntentStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentIntentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'clientSecret': _clientSecret,
        'customerId': _customerId,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clientSecret': serializeParam(
          _clientSecret,
          ParamType.String,
        ),
        'customerId': serializeParam(
          _customerId,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static PaymentIntentStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentIntentStruct(
        clientSecret: deserializeParam(
          data['clientSecret'],
          ParamType.String,
          false,
        ),
        customerId: deserializeParam(
          data['customerId'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PaymentIntentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentIntentStruct &&
        clientSecret == other.clientSecret &&
        customerId == other.customerId &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([clientSecret, customerId, id]);
}

PaymentIntentStruct createPaymentIntentStruct({
  String? clientSecret,
  String? customerId,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentIntentStruct(
      clientSecret: clientSecret,
      customerId: customerId,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentIntentStruct? updatePaymentIntentStruct(
  PaymentIntentStruct? paymentIntent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentIntent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentIntentStructData(
  Map<String, dynamic> firestoreData,
  PaymentIntentStruct? paymentIntent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentIntent == null) {
    return;
  }
  if (paymentIntent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentIntent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentIntentData =
      getPaymentIntentFirestoreData(paymentIntent, forFieldValue);
  final nestedData =
      paymentIntentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentIntent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentIntentFirestoreData(
  PaymentIntentStruct? paymentIntent, [
  bool forFieldValue = false,
]) {
  if (paymentIntent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentIntent.toMap());

  // Add any Firestore field values
  paymentIntent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentIntentListFirestoreData(
  List<PaymentIntentStruct>? paymentIntents,
) =>
    paymentIntents
        ?.map((e) => getPaymentIntentFirestoreData(e, true))
        .toList() ??
    [];
