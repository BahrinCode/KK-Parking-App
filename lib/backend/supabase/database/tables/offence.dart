import '../database.dart';

class OffenceTable extends SupabaseTable<OffenceRow> {
  @override
  String get tableName => 'offence';

  @override
  OffenceRow createRow(Map<String, dynamic> data) => OffenceRow(data);
}

class OffenceRow extends SupabaseDataRow {
  OffenceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OffenceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double get offenceAmount => getField<double>('offence_amount')!;
  set offenceAmount(double value) => setField<double>('offence_amount', value);

  String? get offenceDetails => getField<String>('offence_details');
  set offenceDetails(String? value) =>
      setField<String>('offence_details', value);
}
