import '../database.dart';

class CouponcodeTable extends SupabaseTable<CouponcodeRow> {
  @override
  String get tableName => 'couponcode';

  @override
  CouponcodeRow createRow(Map<String, dynamic> data) => CouponcodeRow(data);
}

class CouponcodeRow extends SupabaseDataRow {
  CouponcodeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CouponcodeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get code => getField<String>('code');
  set code(String? value) => setField<String>('code', value);

  bool? get isUsed => getField<bool>('isUsed');
  set isUsed(bool? value) => setField<bool>('isUsed', value);

  int get amount => getField<int>('amount')!;
  set amount(int value) => setField<int>('amount', value);
}
