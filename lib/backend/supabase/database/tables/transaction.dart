import '../database.dart';

class TransactionTable extends SupabaseTable<TransactionRow> {
  @override
  String get tableName => 'transaction';

  @override
  TransactionRow createRow(Map<String, dynamic> data) => TransactionRow(data);
}

class TransactionRow extends SupabaseDataRow {
  TransactionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TransactionTable();

  int get transactionId => getField<int>('transaction_id')!;
  set transactionId(int value) => setField<int>('transaction_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get transactionType => getField<String>('transaction_type');
  set transactionType(String? value) =>
      setField<String>('transaction_type', value);

  double? get amount => getField<double>('amount');
  set amount(double? value) => setField<double>('amount', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);
}
