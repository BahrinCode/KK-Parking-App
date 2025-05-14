import '../database.dart';

class VehicleTable extends SupabaseTable<VehicleRow> {
  @override
  String get tableName => 'vehicle';

  @override
  VehicleRow createRow(Map<String, dynamic> data) => VehicleRow(data);
}

class VehicleRow extends SupabaseDataRow {
  VehicleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VehicleTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get vehicleNo => getField<String>('vehicle_no');
  set vehicleNo(String? value) => setField<String>('vehicle_no', value);

  String? get vehicleType => getField<String>('vehicle_type');
  set vehicleType(String? value) => setField<String>('vehicle_type', value);

  String? get vehicleModel => getField<String>('vehicle_model');
  set vehicleModel(String? value) => setField<String>('vehicle_model', value);

  String? get vehicleColor => getField<String>('vehicle_color');
  set vehicleColor(String? value) => setField<String>('vehicle_color', value);

  bool? get isdefault => getField<bool>('isdefault');
  set isdefault(bool? value) => setField<bool>('isdefault', value);

  int get vehicleId => getField<int>('vehicle_id')!;
  set vehicleId(int value) => setField<int>('vehicle_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  int? get year => getField<int>('year');
  set year(int? value) => setField<int>('year', value);
}
