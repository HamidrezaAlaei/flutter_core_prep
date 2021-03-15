import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HiveService {
  static HiveInterface _hive = Hive;

  /// Caches the model inside a box with the name [boxName] as the property name of [propertyName]
  ///
  /// Returns [void]
  void cache(HiveObject model, String boxName, String propertyName,
      {Function onError}) async {
    return await boxInteraction<dynamic, void>(boxName, (Box box) async {
      await box.put(propertyName, model);
    }, onError);
  }

  /// Retrieves the model inside a box with the name [boxName] and the property name of [propertyName]
  /// Does not close the hive box and other hive methods should implement box.close()!!!!
  ///
  /// Returns [T] as the type of the returned object
  Future<T> retrieve<T>(String boxName, String propertyName,
      {Function onError}) async {
    return await boxInteraction<dynamic, T>(boxName, (Box box) async {
      return await box.get(propertyName) as T;
    }, onError);
  }

  /// Asks for box with the name [boxName] and the Hive object that already exists in our model called [model]
  /// Updates the cache value already stored in the hive.
  ///
  /// Returns [void]
  void boxUpdate(String boxName, HiveObject model) async {
    final box = await _hive.openBox(boxName);
    model.save();
    box.close();
  }

  //          ########## HELPER METHODSs ##########

  /// Handles the opening and closing of the box. Acts as a context manager of the hive box.
  ///
  /// [E] refers to the return type of [Box]
  /// [T] refers to the return type of the function
  ///
  // ignore: missing_return
  Future<T> boxInteraction<E, T>(
      boxName, Future<T> Function(Box<E>) action, Function onError) async {
    try {
      final box = await _hive.openBox<E>(boxName);
      final T result = await action(box);
      // await box.close();
      return result;
    } on Exception catch (e) {
      print(e);
      if (onError != null) onError(e);
    }
  }
}
