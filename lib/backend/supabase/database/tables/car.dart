import '../database.dart';

class CarTable extends SupabaseTable<CarRow> {
  @override
  String get tableName => 'car';

  @override
  CarRow createRow(Map<String, dynamic> data) => CarRow(data);
}

class CarRow extends SupabaseDataRow {
  CarRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);
}
