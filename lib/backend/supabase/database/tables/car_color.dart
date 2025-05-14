import '../database.dart';

class CarColorTable extends SupabaseTable<CarColorRow> {
  @override
  String get tableName => 'car_color';

  @override
  CarColorRow createRow(Map<String, dynamic> data) => CarColorRow(data);
}

class CarColorRow extends SupabaseDataRow {
  CarColorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CarColorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);
}
