import '../database.dart';

class ReviewTable extends SupabaseTable<ReviewRow> {
  @override
  String get tableName => 'review';

  @override
  ReviewRow createRow(Map<String, dynamic> data) => ReviewRow(data);
}

class ReviewRow extends SupabaseDataRow {
  ReviewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReviewTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get rate => getField<int>('rate');
  set rate(int? value) => setField<int>('rate', value);

  String? get reviewText => getField<String>('review_text');
  set reviewText(String? value) => setField<String>('review_text', value);
}
