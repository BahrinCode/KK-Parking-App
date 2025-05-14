import '../database.dart';

class CompoundTable extends SupabaseTable<CompoundRow> {
  @override
  String get tableName => 'compound';

  @override
  CompoundRow createRow(Map<String, dynamic> data) => CompoundRow(data);
}

class CompoundRow extends SupabaseDataRow {
  CompoundRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CompoundTable();

  int get finesId => getField<int>('fines-id')!;
  set finesId(int value) => setField<int>('fines-id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get fineAmount => getField<double>('fine_amount');
  set fineAmount(double? value) => setField<double>('fine_amount', value);

  String? get fineStatus => getField<String>('fine_status');
  set fineStatus(String? value) => setField<String>('fine_status', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get vehicleNo => getField<String>('vehicle_no');
  set vehicleNo(String? value) => setField<String>('vehicle_no', value);

  String? get fineDetail => getField<String>('fine_detail');
  set fineDetail(String? value) => setField<String>('fine_detail', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int? get permitId => getField<int>('permit_id');
  set permitId(int? value) => setField<int>('permit_id', value);

  String? get issueBy => getField<String>('issue_by');
  set issueBy(String? value) => setField<String>('issue_by', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get year => getField<String>('year');
  set year(String? value) => setField<String>('year', value);

  String? get model => getField<String>('model');
  set model(String? value) => setField<String>('model', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);
}
