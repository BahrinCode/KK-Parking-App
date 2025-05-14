import '../database.dart';

class PermitTable extends SupabaseTable<PermitRow> {
  @override
  String get tableName => 'permit';

  @override
  PermitRow createRow(Map<String, dynamic> data) => PermitRow(data);
}

class PermitRow extends SupabaseDataRow {
  PermitRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PermitTable();

  int get permitId => getField<int>('permit_id')!;
  set permitId(int value) => setField<int>('permit_id', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  String? get vehicleNo => getField<String>('vehicle_no');
  set vehicleNo(String? value) => setField<String>('vehicle_no', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  int? get parkinglocationId => getField<int>('parkinglocation_id');
  set parkinglocationId(int? value) =>
      setField<int>('parkinglocation_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime get startTime => getField<DateTime>('start_time')!;
  set startTime(DateTime value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);
}
