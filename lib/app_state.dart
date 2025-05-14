import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _user = prefs
              .getStringList('ff_user')
              ?.map((x) {
                try {
                  return RoleStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _user;
    });
    _safeInit(() {
      _location = prefs.getString('ff_location') ?? _location;
    });
    _safeInit(() {
      _defaultcar = prefs.getString('ff_defaultcar') ?? _defaultcar;
    });
    _safeInit(() {
      _defaultcounter = prefs.getInt('ff_defaultcounter') ?? _defaultcounter;
    });
    _safeInit(() {
      _transactionParking =
          prefs.getDouble('ff_transactionParking') ?? _transactionParking;
    });
    _safeInit(() {
      _index = prefs.getInt('ff_index') ?? _index;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<CarBrandsStruct> _car = [];
  List<CarBrandsStruct> get car => _car;
  set car(List<CarBrandsStruct> value) {
    _car = value;
  }

  void addToCar(CarBrandsStruct value) {
    car.add(value);
  }

  void removeFromCar(CarBrandsStruct value) {
    car.remove(value);
  }

  void removeAtIndexFromCar(int index) {
    car.removeAt(index);
  }

  void updateCarAtIndex(
    int index,
    CarBrandsStruct Function(CarBrandsStruct) updateFn,
  ) {
    car[index] = updateFn(_car[index]);
  }

  void insertAtIndexInCar(int index, CarBrandsStruct value) {
    car.insert(index, value);
  }

  List<RoleStruct> _user = [];
  List<RoleStruct> get user => _user;
  set user(List<RoleStruct> value) {
    _user = value;
    prefs.setStringList('ff_user', value.map((x) => x.serialize()).toList());
  }

  void addToUser(RoleStruct value) {
    user.add(value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void removeFromUser(RoleStruct value) {
    user.remove(value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUser(int index) {
    user.removeAt(index);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void updateUserAtIndex(
    int index,
    RoleStruct Function(RoleStruct) updateFn,
  ) {
    user[index] = updateFn(_user[index]);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUser(int index, RoleStruct value) {
    user.insert(index, value);
    prefs.setStringList('ff_user', _user.map((x) => x.serialize()).toList());
  }

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
    prefs.setString('ff_location', value);
  }

  String _defaultcar = '';
  String get defaultcar => _defaultcar;
  set defaultcar(String value) {
    _defaultcar = value;
    prefs.setString('ff_defaultcar', value);
  }

  int _defaultcounter = 0;
  int get defaultcounter => _defaultcounter;
  set defaultcounter(int value) {
    _defaultcounter = value;
    prefs.setInt('ff_defaultcounter', value);
  }

  double _transactionParking = 0.0;
  double get transactionParking => _transactionParking;
  set transactionParking(double value) {
    _transactionParking = value;
    prefs.setDouble('ff_transactionParking', value);
  }

  int _index = 0;
  int get index => _index;
  set index(int value) {
    _index = value;
    prefs.setInt('ff_index', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
