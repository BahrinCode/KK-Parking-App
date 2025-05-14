import '../database.dart';

class EnforcementTable extends SupabaseTable<EnforcementRow> {
  @override
  String get tableName => 'enforcement';

  @override
  EnforcementRow createRow(Map<String, dynamic> data) => EnforcementRow(data);
}

class EnforcementRow extends SupabaseDataRow {
  EnforcementRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EnforcementTable();

  int get enforceId => getField<int>('enforce_id')!;
  set enforceId(int value) => setField<int>('enforce_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get locationId => getField<int>('location_id');
  set locationId(int? value) => setField<int>('location_id', value);

  String? get phoneNo => getField<String>('phone_no');
  set phoneNo(String? value) => setField<String>('phone_no', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);
}
