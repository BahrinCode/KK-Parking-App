import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get fname => getField<String>('fname');
  set fname(String? value) => setField<String>('fname', value);

  String? get lname => getField<String>('lname');
  set lname(String? value) => setField<String>('lname', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get profileImage => getField<String>('profileImage');
  set profileImage(String? value) => setField<String>('profileImage', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  String? get userReference => getField<String>('user Reference');
  set userReference(String? value) => setField<String>('user Reference', value);
}
