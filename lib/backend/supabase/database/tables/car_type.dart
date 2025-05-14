import '../database.dart';

class CarTypeTable extends SupabaseTable<CarTypeRow> {
  @override
  String get tableName => 'car_type';

  @override
  CarTypeRow createRow(Map<String, dynamic> data) => CarTypeRow(data);
}

class CarTypeRow extends SupabaseDataRow {
  CarTypeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarTypeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
