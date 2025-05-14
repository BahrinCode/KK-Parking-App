import '../database.dart';

class ParkingLocationTable extends SupabaseTable<ParkingLocationRow> {
  @override
  String get tableName => 'parking_location';

  @override
  ParkingLocationRow createRow(Map<String, dynamic> data) =>
      ParkingLocationRow(data);
}

class ParkingLocationRow extends SupabaseDataRow {
  ParkingLocationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParkingLocationTable();

  int get parkinglocationId => getField<int>('parkinglocation_id')!;
  set parkinglocationId(int value) =>
      setField<int>('parkinglocation_id', value);

  String get locationName => getField<String>('location_name')!;
  set locationName(String value) => setField<String>('location_name', value);

  double? get parkingRate => getField<double>('parking_rate');
  set parkingRate(double? value) => setField<double>('parking_rate', value);

  String? get cityState => getField<String>('cityState');
  set cityState(String? value) => setField<String>('cityState', value);
}
