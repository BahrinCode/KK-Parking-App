import '../database.dart';

class MessageSupportTable extends SupabaseTable<MessageSupportRow> {
  @override
  String get tableName => 'message_support';

  @override
  MessageSupportRow createRow(Map<String, dynamic> data) =>
      MessageSupportRow(data);
}

class MessageSupportRow extends SupabaseDataRow {
  MessageSupportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageSupportTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get requestId => getField<int>('request_id');
  set requestId(int? value) => setField<int>('request_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);
}
