import '../database.dart';

class SupportReqTable extends SupabaseTable<SupportReqRow> {
  @override
  String get tableName => 'support_req';

  @override
  SupportReqRow createRow(Map<String, dynamic> data) => SupportReqRow(data);
}

class SupportReqRow extends SupabaseDataRow {
  SupportReqRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportReqTable();

  int get requestId => getField<int>('request_id')!;
  set requestId(int value) => setField<int>('request_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);
}
