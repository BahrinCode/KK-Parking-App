// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarBrandsStruct extends FFFirebaseStruct {
  CarBrandsStruct({
    String? name,
    String? origin,
    List<String>? popularModels,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _origin = origin,
        _popularModels = popularModels,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  set origin(String? val) => _origin = val;

  bool hasOrigin() => _origin != null;

  // "popular_models" field.
  List<String>? _popularModels;
  List<String> get popularModels => _popularModels ?? const [];
  set popularModels(List<String>? val) => _popularModels = val;

  void updatePopularModels(Function(List<String>) updateFn) {
    updateFn(_popularModels ??= []);
  }

  bool hasPopularModels() => _popularModels != null;

  static CarBrandsStruct fromMap(Map<String, dynamic> data) => CarBrandsStruct(
        name: data['name'] as String?,
        origin: data['origin'] as String?,
        popularModels: getDataList(data['popular_models']),
      );

  static CarBrandsStruct? maybeFromMap(dynamic data) => data is Map
      ? CarBrandsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'origin': _origin,
        'popular_models': _popularModels,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'origin': serializeParam(
          _origin,
          ParamType.String,
        ),
        'popular_models': serializeParam(
          _popularModels,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CarBrandsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CarBrandsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        origin: deserializeParam(
          data['origin'],
          ParamType.String,
          false,
        ),
        popularModels: deserializeParam<String>(
          data['popular_models'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CarBrandsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CarBrandsStruct &&
        name == other.name &&
        origin == other.origin &&
        listEquality.equals(popularModels, other.popularModels);
  }

  @override
  int get hashCode => const ListEquality().hash([name, origin, popularModels]);
}

CarBrandsStruct createCarBrandsStruct({
  String? name,
  String? origin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CarBrandsStruct(
      name: name,
      origin: origin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CarBrandsStruct? updateCarBrandsStruct(
  CarBrandsStruct? carBrands, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    carBrands
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCarBrandsStructData(
  Map<String, dynamic> firestoreData,
  CarBrandsStruct? carBrands,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (carBrands == null) {
    return;
  }
  if (carBrands.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && carBrands.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final carBrandsData = getCarBrandsFirestoreData(carBrands, forFieldValue);
  final nestedData = carBrandsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = carBrands.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCarBrandsFirestoreData(
  CarBrandsStruct? carBrands, [
  bool forFieldValue = false,
]) {
  if (carBrands == null) {
    return {};
  }
  final firestoreData = mapToFirestore(carBrands.toMap());

  // Add any Firestore field values
  carBrands.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCarBrandsListFirestoreData(
  List<CarBrandsStruct>? carBrandss,
) =>
    carBrandss?.map((e) => getCarBrandsFirestoreData(e, true)).toList() ?? [];
