import '../database.dart';

class SeasonalPassTable extends SupabaseTable<SeasonalPassRow> {
  @override
  String get tableName => 'seasonal_pass';

  @override
  SeasonalPassRow createRow(Map<String, dynamic> data) => SeasonalPassRow(data);
}

class SeasonalPassRow extends SupabaseDataRow {
  SeasonalPassRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SeasonalPassTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get start => getField<DateTime>('start');
  set start(DateTime? value) => setField<DateTime>('start', value);

  DateTime? get end => getField<DateTime>('end');
  set end(DateTime? value) => setField<DateTime>('end', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  bool? get isActive => getField<bool>('isActive');
  set isActive(bool? value) => setField<bool>('isActive', value);
}
